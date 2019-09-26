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
    
    let detailTextViewFontSize: CGFloat = 16

    static func make(with viewModel: DetailViewModel) -> DetailViewController {
        let view = DetailViewController.instantiate()
        view.viewModel = viewModel
        return view
    }

    @IBOutlet private weak var indicatorView: UIActivityIndicatorView!
    @IBOutlet private weak var tableView: UITableView!

    private var viewModel: DetailViewModelType!
    private let disposeBag = DisposeBag()
    
    
    @IBOutlet weak var selfTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let observableItems = Observable<[PostData]>.just([self.viewModel.outputs.post, self.viewModel.outputs.post])
        
        viewModel.outputs.navigationBarTitle
            .observeOn(MainScheduler.instance)
            .bind(to: navigationItem.rx.title)
            .disposed(by: disposeBag)
        
        observableItems
        .observeOn(MainScheduler.instance)
        .bind(to: tableView.rx.items) { tableView, row, post in
            if(row == 0){
                let cell = ViewControllerHelper.getCustomCell(post);
                cell.textLabel?.font = UIFont.boldSystemFont(ofSize: self.detailTextViewFontSize)
                return cell
            }
            else{
                return ViewControllerHelper.getDetailCell(post);
            }
        }
        .disposed(by: disposeBag)
    }

}

extension DetailViewController: StoryboardInstantiable {}


