//
//  UserDetailsViewController.swift
//  PostTestTask
//
//  Created by Igor Poliukhovych on 23.11.2022.
//

import UIKit

class UserDetailsViewController: BaseViewController {
    
    var viewModel: UserDetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        usersTableView.register(UserDetailsTableViewCell.self, forCellReuseIdentifier: UserDetailsTableViewCell.identifier)
        usersTableView.delegate = self
        usersTableView.alwaysBounceVertical = false
        usersTableView.dataSource = self
        usersTableView.register(UserDetailsHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: UserDetailsHeaderFooterView.identifier)
        title = Localization.UserDetail.title
    }
    
}

extension UserDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userInfo.userPosts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserDetailsTableViewCell.identifier, for: indexPath) as! UserDetailsTableViewCell
        cell.configureCell(with: viewModel.userInfo.userPosts?[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
                                                                UserDetailsHeaderFooterView.identifier) as! UserDetailsHeaderFooterView
        view.configureImageView(with: viewModel.userInfo.url)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
}
