//
//  UserHomeViewController.swift
//  PostTestTask
//
//  Created by Igor Poliukhovych on 23.11.2022.
//

import UIKit

class UserHomeViewController: BaseViewController {

    var coordinator: MainCoordinator?
    var viewModel: UserHomeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.getUsersPost()
    }
    
    private func setupUI() {
        usersTableView.register(UserTableViewCell.self, forCellReuseIdentifier: UserTableViewCell.identifier)
        usersTableView.dataSource = self
        usersTableView.delegate = self
        viewModel.delegate = self
        title = Localization.User.userTitle
    }
}

extension UserHomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as! UserTableViewCell
        cell.delegate = self
        cell.configureCell(viewModel.userList[indexPath.row])
        return cell
    }
    
}

extension UserHomeViewController: GetUserList {
    func selectUser(_ user: UserViewModel) {
        coordinator?.moveToUserDetail(with: user)
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.usersTableView.reloadData()
        }
    }
    
    
}

extension UserHomeViewController: UserTableViewCellDelegate {

    func didSelectRow(_ cell: UserTableViewCell) {
        guard let index = usersTableView.indexPath(for: cell) else { return }
        viewModel.didSelectUser(at: index.row)
    }
}
