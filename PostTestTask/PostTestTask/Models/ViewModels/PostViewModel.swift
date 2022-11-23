//
//  PostViewModel.swift
//  PostTestTask
//
//  Created by Igor Poliukhovych on 23.11.2022.
//

import Foundation

struct PostViewModel {
    let userID, id: Int
    let title, body: String
    
    init(model: Post) {
        self.userID = model.userID
        self.id = model.id
        self.title = model.title
        self.body = model.body
    }
}
