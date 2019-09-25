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
        let id: String
        let page: Int
        var after: String?
        var path: String = "/r/"

        init(topic: String = "swift", page: Int, id: String = "") {
            self.topic = topic
            self.page = page
            self.id = id
            self.path += "\(topic)/\(id).json"
        }
/*
        var queryParameters: [String: Any]? {
            var params = [String: Any]()
            if(id == ""){
                    params["raw_json"] = "1"
            }
            return params
        }
        
        var headerFields: [String: String] {
            var fields = [String: String]()
            if(id != ""){
                    fields["Accept"] = "application/json"
            }
            return fields;
        }
        

        var parameters: Any? {
            var params = [String: Any]()
            params["limit"] = 15
            params["after"] = after
            return params
        }
*/
        // MARK: - Request Type
        let method: HTTPMethod = .get
        

        func response(from object: Any, urlResponse: HTTPURLResponse) throws -> [PostData] {
            guard let data = object as? Data else {
                throw ResponseError.unexpectedObject(object)
            }
            do{
                let res = try JSONDecoder().decode(Listing.self, from: data)
                return res.data.children;
            }
            catch{
                    let string1 = String(data: data, encoding: String.Encoding.utf8) ?? "Data could not be printed"
                    print(string1)
            }
            return []
        }
    }
}
