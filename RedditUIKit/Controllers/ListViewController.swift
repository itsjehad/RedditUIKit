//
//  ListViewController.swift
//  RedditUIKit
//
//  Created by Jehad Sarkar on 2019-09-23.
//  Copyright © 2019 itsjehad. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Kingfisher
import SnapKit

final class ListViewController: UIViewController {

    static func make(with viewModel: ListViewModel) -> ListViewController {
        let view = ListViewController.instantiate()
        view.viewModel = viewModel
        return view
    }

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var indicatorView: UIActivityIndicatorView!

    private var viewModel: ListViewModelType!
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.estimatedRowHeight = 120
        //tableView.rowHeight = UITableView.automaticDimension
        // Bind ViewModel Outputs
        viewModel.outputs.navigationBarTitle
            .observeOn(MainScheduler.instance)
            .bind(to: navigationItem.rx.title)
            .disposed(by: disposeBag)

        viewModel.outputs.redditListings
            .observeOn(MainScheduler.instance)
            .bind(to: tableView.rx.items) { tableView, row, post in
                return ViewControllerHelper.getCustomCell(post);
            }
            .disposed(by: disposeBag)


        tableView.rx.modelSelected(PostData.self)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] in
                let vc = DetailViewController.make(with: DetailViewModel(post: $0))
                self?.navigationController?.pushViewController(vc, animated: true)
            })
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

        viewModel.outputs.error
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] in
                let ac = UIAlertController(title: "Error \($0)", message: nil, preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self?.present(ac, animated: true)
            })
            .disposed(by: disposeBag)

        
/*
        // Bind ViewModel Inputs
        tableView.rx.reachedBottom.asObservable()
            .bind(to: viewModel.inputs.reachedBottomTrigger)
            .disposed(by: disposeBag)
*/
        viewModel.inputs.fetchTrigger.onNext(())
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.indexPathsForSelectedRows?.forEach { [weak self] in
            self?.tableView.deselectRow(at: $0, animated: true)
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        //let image = images[indexPath.row].image
        //let aspectRatioImg = image.size.height / image.size.width

        //return view.bounds.width * aspectRatioImg + 103
        return 200
    
    }
}



extension ListViewController: StoryboardInstantiable {}
