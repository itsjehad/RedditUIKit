//
//  ViewControllerHelper.swift
//  RedditUIKit
//
//  Created by Jehad Sarkar on 2019-09-25.
//  Copyright © 2019 itsjehad. All rights reserved.
//

import UIKit

class ViewControllerHelper{
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
        cell.textLabel?.numberOfLines = 2;
        cell.textLabel?.lineBreakMode = .byWordWrapping
        
        return cell
    }
    static func getDetailCell(_ post: PostData ) -> UITableViewCell{
        let cell = UITableViewCell(style: .default, reuseIdentifier: "subtitle")
        cell.textLabel?.text = post.data.selftext
        cell.textLabel?.numberOfLines = 0;
        cell.textLabel?.lineBreakMode = .byWordWrapping
        return cell
    }
}
