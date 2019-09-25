//
//  DetailViewModel.swift
//  RedditUIKit
//
//  Created by Jehad Sarkar on 2019-09-24.
//  Copyright © 2019 itsjehad. All rights reserved.
//


import RxCocoa
import RxSwift
import Action
import APIKit

protocol DetailViewModelInputs {
    var fetchTrigger: PublishSubject<Void> { get }
}

protocol DetailViewModelOutputs {
    var post: PostData { get }
    var request: URLRequest { get }
    var navigationBarTitle: Observable<String> { get }
    var redditListings: Observable<[PostData]> { get }
    var isLoading: Observable<Bool> { get }
    var error: Observable<NSError> { get }
    //var methdaData: Observable<String>{get}
    //var comments: Observable<String>{get}
}

protocol DetailViewModelType {
    var inputs: DetailViewModelInputs { get }
    var outputs: DetailViewModelOutputs { get }
}

final class DetailViewModel: DetailViewModelType, DetailViewModelInputs, DetailViewModelOutputs {
    var redditListings: Observable<[PostData]>
    var inputs: DetailViewModelInputs { return self }
    var outputs: DetailViewModelOutputs { return self }

    // MARK: - Inputs

    // MARK: - Outputs
    let post: PostData
    let request: URLRequest
    let navigationBarTitle: Observable<String>
    
    let isLoading: Observable<Bool>
    let error: Observable<NSError>
    var after = ""

    private let searchAction: Action<Int, [PostData]>
    private let page = BehaviorRelay<Int>(value: 1)
    let fetchTrigger = PublishSubject<Void>()
    

    private let disposeBag = DisposeBag()

    init(post: PostData) {
        self.post = post
        self.request = URLRequest(url: URL(string: post.data.url)!)
        self.navigationBarTitle = Observable.just(post.data.title)
        
        self.searchAction = Action { page in
            return Session.shared.rx.response(RedditApi.SearchRequest(topic: post.data.subreddit, page: page, id: post.data.id))
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

        fetchTrigger
            .withLatestFrom(page)
            .bind(to: searchAction.inputs)
            .disposed(by: disposeBag)
        
    }

}


