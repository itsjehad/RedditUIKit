//
//  Listing.swift
//  RedditUIKit
//
//  Created by Jehad Sarkar on 2019-09-23.
//  Copyright © 2019 itsjehad. All rights reserved.
//

import Foundation

struct ListingList: Decodable {
    let data: ListingData
    struct ListingData: Decodable {
        let children: [Listing]
    }
}

struct Listing: Decodable {
    let data: ListingData
    struct ListingData: Decodable {
        let children: [PostData]
    }
}
struct PostData: Decodable {
    let data: Post
}
struct CommentListing: Decodable {
    let data: CommentListingData
    
    struct CommentListingData: Decodable {
        let children: [CommentData]
        
        struct CommentData: Decodable {
            let data: Comment
        }
    }
}

struct SearchRepositoriesResponse: Decodable {
    let items: Listing
}

