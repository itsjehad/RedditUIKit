//
//  RedditAPI.swift
//  RedditUIKit
//
//  Created by Jehad Sarkar on 2019-09-23.
//  Copyright © 2019 itsjehad. All rights reserved.
//

import Foundation
import APIKit

final class RedditApi {}

// MARK: API struct & Enums
extension RedditApi {

    struct SearchRequest: RedditRequest {

        // MARK: - Initialize
        let topic: String
        let id: Int
        var path: String = "/r/"

        init(topic: String = "swift", page: Int) {
            self.topic = topic
            self.id = page
            self.path += "\(topic)/.json"
        }

        // MARK: - Request Type
        let method: HTTPMethod = .get
        

        func response(from object: Any, urlResponse: HTTPURLResponse) throws -> [PostData] {
            guard let data = object as? Data else {
                throw ResponseError.unexpectedObject(object)
            }
            let res = try JSONDecoder().decode(Listing.self, from: data)
            return res.data.children;
        }
    }

}
