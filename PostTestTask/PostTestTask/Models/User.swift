//
//  User.swift
//  PostTestTask
//
//  Created by Igor Poliukhovych on 23.11.2022.
//

import Foundation

struct User: Codable {
    let albumID, userID: Int
    let name: String
    let url, thumbnailURL: String
    
    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case userID = "userId"
        case name, url
        case thumbnailURL = "thumbnailUrl"
    }
}
