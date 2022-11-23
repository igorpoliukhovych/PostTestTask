//
//  UserHomeViewModel.swift
//  PostTestTask
//
//  Created by Igor Poliukhovych on 23.11.2022.
//

import Foundation

protocol GetUserList {
    func reloadTableView()
    func selectUser(_ user: UserViewModel)
}

class UserHomeViewModel {
    
    var delegate: GetUserList?
    var userList = [UserViewModel]()
    private var userPosts = [PostViewModel]()
    
    func getUsersPost() {
        NetworkManager.shared.getUsersPost { resutl in
            switch resutl {
            case .success(let posts):
                guard let posts = posts else { break }
                self.userPosts = posts.map({ PostViewModel(model: $0) })
                self.getUserList()
            case .failure(let failure):
                print(failure ?? "")
            }
        }
    }
    
    private func filterUsersPost() {
        for (num, list) in userList.enumerated() {
            userList[num].userPosts = userPosts.filter({$0.userID == list.userID})
        }
    }
    
    private func getUserList() {
        NetworkManager.shared.getUsersList { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let success):
                guard let userList = success else { return }
                self.userList = userList.map({ UserViewModel(model: $0) })
                self.filterUsersPost()
                self.delegate?.reloadTableView()
            case .failure(let failure):
                print(failure ?? "")
            }
        }
    }
}

extension UserHomeViewModel {
    func didSelectUser(at index: Int) {
        delegate?.selectUser(userList[index])
    }
}
