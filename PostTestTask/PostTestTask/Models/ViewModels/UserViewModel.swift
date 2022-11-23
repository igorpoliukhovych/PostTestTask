//
//  UserViewModel.swift
//  PostTestTask
//
//  Created by Igor Poliukhovych on 23.11.2022.
//

import Foundation

struct UserViewModel {
    let userID: Int
    let name: String
    let url, thumbnailURL: String
    var userPosts: [PostViewModel]?
    
    init(model: User) {
        self.userID = model.userID
        self.name = model.name
        self.url = model.url
        self.thumbnailURL = model.thumbnailURL
    }
}
