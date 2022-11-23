//
//  UserDetailsTableViewCell.swift
//  PostTestTask
//
//  Created by Igor Poliukhovych on 23.11.2022.
//

import UIKit

class UserDetailsTableViewCell: UITableViewCell {
    static let identifier = "UserDetailsTableViewCell"
    
    lazy var borderView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 15
        return view
    }()
    
    lazy private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy private var bodyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: UserDetailsTableViewCell.identifier)
        self.backgroundColor = .clear
        selectionStyle = .none
        configureSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureSubviews() {
        contentView.addSubview(borderView)
        borderView.addSubview(titleLabel)
        borderView.addSubview(bodyLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            borderView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            borderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            contentView.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: 10),
            contentView.bottomAnchor.constraint(equalTo: borderView.bottomAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: borderView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 10),
            borderView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            borderView.bottomAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: 10),
            bodyLabel.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 10),
            borderView.trailingAnchor.constraint(equalTo: bodyLabel.trailingAnchor, constant: 10)
        ])
        
    }
    
    func configureCell(with model: PostViewModel?) {
        titleLabel.text = model?.title
        bodyLabel.text = model?.body
    }
}
