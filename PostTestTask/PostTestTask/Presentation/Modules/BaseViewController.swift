//
//  BaseViewController.swift
//  PostTestTask
//
//  Created by Igor Poliukhovych on 23.11.2022.
//

import UIKit

class BaseViewController: UIViewController {

    lazy var usersTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        configureSubviews()
        setupConstraints()
    }

    private func configureSubviews() {
        view.addSubview(usersTableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            usersTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            usersTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            usersTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            usersTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
