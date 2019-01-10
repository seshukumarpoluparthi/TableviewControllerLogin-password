//
//  Model_Json.swift
//  Test11
//
//  Created by apple on 11/23/18.
//  Copyright © 2018 apple. All rights reserved.
//

import Foundation

typealias Welcome = [String: [model_json]]

struct model_json: Codable {
    let seasonID: Int?
    let genre: [String]
    let about: String
    let isPurchased: Bool
    let title, coverImage: String
    let authorID: Int
    let isLive: Bool
    let authorName: AuthorName
    let isPublished: Bool
    
    enum CodingKeys: String, CodingKey {
        case seasonID = "season_id"
        case genre, about
        case isPurchased = "is_purchased"
        case title
        case coverImage = "cover_image"
        case authorID = "author_id"
        case isLive = "is_live"
        case authorName = "author_name"
        case isPublished = "is_published"
    }
}

enum AuthorName: String, Codable {
    case charanTeja = "Charan Teja"
    case davidMarkBrown = "David Mark Brown"
    case vamshi = "Vamshi"
}
