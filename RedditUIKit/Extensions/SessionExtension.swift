//
//  SessionExtension.swift
//  RxSwiftMVVM
//
//  Created by Tsubasa Hayashi on 2019/04/29.
//  Copyright © 2019 Tsubasa Hayashi. All rights reserved.
//

import Foundation
import RxSwift
import APIKit

extension Session: ReactiveCompatible {}

extension Reactive where Base: Session {
    func response<T: Request>(_ request: T) -> Observable<T.Response> {
        return Observable<T.Response>.create { [weak base] observer -> Disposable in
    
            let task = base?.send(request) { result in
                switch result {
                case .success(let value):
                    observer.onNext(value)
                    observer.onCompleted()
                case .failure(let error):
                    observer.onError(error)
                }
            }
            return Disposables.create { task?.cancel() }
        }
    }
}
