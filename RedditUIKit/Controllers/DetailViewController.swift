//
//  DetailViewController.swift
//  RedditUIKit
//
//  Created by Jehad Sarkar on 2019-09-24.
//  Copyright © 2019 itsjehad. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import WebKit
import RxWebKit

final class DetailViewController: UIViewController {

    static func make(with viewModel: DetailViewModel) -> DetailViewController {
        let view = DetailViewController.instantiate()
        view.viewModel = viewModel
        return view
    }

    @IBOutlet private weak var indicatorView: UIActivityIndicatorView!
    @IBOutlet private weak var tableView: UITableView!
    //@IBOutlet private weak var webView: WKWebView!

    private var viewModel: DetailViewModelType!
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.outputs.navigationBarTitle
            .observeOn(MainScheduler.instance)
            .bind(to: navigationItem.rx.title)
            .disposed(by: disposeBag)
        
        viewModel.outputs.redditListings
        .observeOn(MainScheduler.instance)
        .bind(to: tableView.rx.items) { collectionView, row, post in
            return ListViewController.getCustomCell(post);
        }
        .disposed(by: disposeBag)
        
        viewModel.outputs.isLoading
            .observeOn(MainScheduler.instance)
            .bind(to: indicatorView.rx.isAnimating)
            .disposed(by: disposeBag)

        viewModel.outputs.isLoading
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] in
                self?.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: $0 ? 50 : 0, right: 0)
            })
            .disposed(by: disposeBag)
        
        
        
        viewModel.inputs.fetchTrigger.onNext(())
    }
    static func getCustomCell(_ post: PostData ) -> UITableViewCell{
        let cell = UITableViewCell(style: .default, reuseIdentifier: "subtitle")
        let imageUrl =  URL(string: post.data.thumbnail)
        
        cell.imageView?.kf.setImage(with: imageUrl) { result in
            switch result {
            case .success(let value):
                cell.setNeedsLayout()
                print("Image URL: \(String(describing: imageUrl)) Image: \(value.image). Got from: \(value.cacheType)")
            case .failure(let error):
                print("Error: \(error)")
            }
        }
        
        cell.textLabel?.text = "\(post.data.title)"
        cell.textLabel?.numberOfLines = 0;
        cell.textLabel?.lineBreakMode = .byWordWrapping
        return cell
    }
}

extension DetailViewController: StoryboardInstantiable {}
