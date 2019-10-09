//
//  ListViewModel.swift
//  RedditUIKit
//
//  Created by Jehad Sarkar on 2019-09-23.
//  Copyright © 2019 itsjehad. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Action
import APIKit

protocol ListViewModelInputs {
    var fetchTrigger: PublishSubject<Void> { get }
    var reachedBottomTrigger: PublishSubject<Void> { get }
}

protocol ListViewModelOutputs {
    var navigationBarTitle: Observable<String> { get }
    var redditListings: Observable<[Listing]> { get }
    var redditListingPosts: Observable<[PostData]> { get }
    var isLoading: Observable<Bool> { get }
    var error: Observable<NSError> { get }
}

protocol ListViewModelType {
    var inputs: ListViewModelInputs { get }
    var outputs: ListViewModelOutputs { get }
}

final class ListViewModel: ListViewModelType, ListViewModelInputs, ListViewModelOutputs {
    var redditListingPosts: Observable<[PostData]>
    
    private let topic: String = "swift"
    var redditListings: Observable<[Listing]>

    var inputs: ListViewModelInputs { return self }
    var outputs: ListViewModelOutputs { return self }

    // MARK: - Inputs
    let fetchTrigger = PublishSubject<Void>()
    let reachedBottomTrigger = PublishSubject<Void>()
    private let after = BehaviorRelay<String>(value: "")

    // MARK: - Outputs
    let navigationBarTitle: Observable<String>
    let isLoading: Observable<Bool>
    let error: Observable<NSError>

    private let searchAction: Action<String, [Listing]>
    private let disposeBag = DisposeBag()
    

    init(topic: String) {
        self.navigationBarTitle = Observable.just("\(topic) news")
        self.searchAction = Action { after in
            return Session.shared.rx.response(RedditApi.SearchRequest(topic: topic, after: after))
        }
        let response = BehaviorRelay<[Listing]>(value: [])
        self.redditListings = response.asObservable()
        
        let postData = BehaviorRelay<[PostData]>(value: [])
        self.redditListingPosts = postData.asObservable()
        
        self.isLoading = searchAction.executing.startWith(false)
        self.error = searchAction.errors.map { _ in NSError(domain: "Network Error", code: 0, userInfo: nil) }

        searchAction.elements
            .withLatestFrom(redditListings){ ($0, $1) }
            .map({
                    var postDataList: [PostData] = []
                    for listing in $0.1 + $0.0{
                        postDataList = postDataList + listing.data.children
                    }
                    return postDataList
                })
            .bind(to: postData)
            .disposed(by: disposeBag)
        
        searchAction.elements
        .withLatestFrom(redditListings){ ($0, $1) }
            .map{ (($0.1 + $0.0).last?.data.after ?? "") }
        .bind(to: after)
        .disposed(by: disposeBag)

        searchAction.elements
            .withLatestFrom(response) { ($0, $1) }
            .map { ($0.1 + $0.0) }
            .bind(to: response)
            .disposed(by: disposeBag)

        searchAction.elements
            .withLatestFrom(after)
            .map {$0}
            .bind(to: after)
            .disposed(by: disposeBag)

        fetchTrigger
            .withLatestFrom(after)
            .bind(to: searchAction.inputs)
            .disposed(by: disposeBag)

        reachedBottomTrigger
            .withLatestFrom(isLoading)
            .filter { !$0 }
            .withLatestFrom(after)
            .bind(to: searchAction.inputs)
            .disposed(by: disposeBag)
    }

}

