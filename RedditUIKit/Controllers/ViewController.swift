//
//  ViewController.swift
//  RedditUIKit
//
//  Created by Jehad Sarkar on 2019-09-23.
//  Copyright © 2019 itsjehad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func onNewsAction(_ sender: UIButton) {
        var topic = "swift"
        if let buttonTitle = sender.title(for: .normal) {
            switch buttonTitle {
            case "CPP news":
                topic = "cpp"
            case "Kotlin news":
                topic = "kotlin"
            case "Java news":
                topic = "java"
            default:
                topic = "swift"
            }
            let vc = ListViewController.make(with: ListViewModel(topic: topic))
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}

