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
    var redditListings: Observable<[PostData]> { get }
    var isLoading: Observable<Bool> { get }
    var error: Observable<NSError> { get }
}

protocol ListViewModelType {
    var inputs: ListViewModelInputs { get }
    var outputs: ListViewModelOutputs { get }
}

final class ListViewModel: ListViewModelType, ListViewModelInputs, ListViewModelOutputs {
    private let topic: String = "swift"
    var redditListings: Observable<[PostData]>
    
    

    var inputs: ListViewModelInputs { return self }
    var outputs: ListViewModelOutputs { return self }

    // MARK: - Inputs
    let fetchTrigger = PublishSubject<Void>()
    let reachedBottomTrigger = PublishSubject<Void>()
    private let page = BehaviorRelay<Int>(value: 1)

    // MARK: - Outputs
    let navigationBarTitle: Observable<String>
    let isLoading: Observable<Bool>
    let error: Observable<NSError>

    private let searchAction: Action<Int, [PostData]>
    private let disposeBag = DisposeBag()

    init(topic: String) {
        self.navigationBarTitle = Observable.just("\(topic) news")
        self.searchAction = Action { page in
            return Session.shared.rx.response(RedditApi.SearchRequest(topic: topic, page: page))
        }
        let response = BehaviorRelay<[PostData]>(value: [])
        self.redditListings = response.asObservable()
        

        self.isLoading = searchAction.executing.startWith(false)
        self.error = searchAction.errors.map { _ in NSError(domain: "Network Error", code: 0, userInfo: nil) }

        searchAction.elements
            .withLatestFrom(response) { ($0, $1) }
            .map { $0.1 + $0.0 }
            .bind(to: response)
            .disposed(by: disposeBag)

        searchAction.elements
            .withLatestFrom(page)
            .map { $0 + 1 }
            .bind(to: page)
            .disposed(by: disposeBag)

        fetchTrigger
            .withLatestFrom(page)
            .bind(to: searchAction.inputs)
            .disposed(by: disposeBag)

        reachedBottomTrigger
            .withLatestFrom(isLoading)
            .filter { !$0 }
            .withLatestFrom(page)
            .filter { $0 < 5 }
            .bind(to: searchAction.inputs)
            .disposed(by: disposeBag)
    }

}

