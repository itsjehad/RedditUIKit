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
}

protocol DetailViewModelOutputs {
    var coments: Observable<[Post]> { get }
    var navigationBarTitle: Observable<String> { get }
}

protocol DetailViewModelType {
    var inputs: DetailViewModelInputs { get }
    var outputs: DetailViewModelOutputs { get }
}

final class DetailViewModel: DetailViewModelType, DetailViewModelInputs, DetailViewModelOutputs {

    
    var inputs: DetailViewModelInputs { return self }
    var outputs: DetailViewModelOutputs { return self }
    let coments: Observable<[Post]>
    
    let navigationBarTitle: Observable<String>
    
    

    private let disposeBag = DisposeBag()

    init(post: PostData) {
        self.coments = Observable.just(post.data.replies ?? [])
        self.navigationBarTitle = Observable.just(post.data.title)
    }

}


