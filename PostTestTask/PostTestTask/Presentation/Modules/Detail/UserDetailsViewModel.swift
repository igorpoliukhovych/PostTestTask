//
//  UserDetailsViewModel.swift
//  PostTestTask
//
//  Created by Igor Poliukhovych on 23.11.2022.
//

import Foundation

class UserDetailsViewModel {
    
    var userInfo: UserViewModel!

    init(viewModel: UserViewModel) {
        self.userInfo = viewModel
    }
}
