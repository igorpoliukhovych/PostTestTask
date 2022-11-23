//
//  UserTableViewCell.swift
//  PostTestTask
//
//  Created by Igor Poliukhovych on 23.11.2022.
//

import UIKit

protocol UserTableViewCellDelegate: AnyObject {
    func didSelectRow(_ cell: UserTableViewCell)
}

class UserTableViewCell: UITableViewCell {

    static let identifier = "UserTableViewCell"
    
    private lazy var conteinerView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 15
        view.backgroundColor = .systemGray6
        view.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.didSelect))
        view.addGestureRecognizer(tap)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var postCounterLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var openImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "chevron.right")
        
        return imageView
    }()
    
    weak var delegate: UserTableViewCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: UserTableViewCell.identifier)
        self.backgroundColor = .clear
        configureSubviews()
        setupConstraints()
        configureImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    @objc private func didSelect() {
        delegate?.didSelectRow(self)
    }
    
    func configureCell(_ model: UserViewModel) {
         self.selectionStyle = .none
        postCounterLabel.text = String(format: Localization.User.numberOfPosts,
                                       model.userPosts!.count)
        userNameLabel.text = model.name
        userImageView.downloadImage(from: URL(string: model.url))
        
    }
    
    private func configureSubviews() {
        contentView.addSubview(conteinerView)
        
        conteinerView.addSubview(userImageView)
        conteinerView.addSubview(stackView)
        stackView.addArrangedSubview(userNameLabel)
        stackView.addArrangedSubview(postCounterLabel)
        conteinerView.addSubview(openImageView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            conteinerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            conteinerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            self.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: 15),
            self.bottomAnchor.constraint(equalTo: conteinerView.safeAreaLayoutGuide.bottomAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            userImageView.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: 30),
            userImageView.topAnchor.constraint(equalTo: conteinerView.topAnchor, constant: 15),
            conteinerView.bottomAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 15),
            userImageView.widthAnchor.constraint(equalToConstant: 50),
            userImageView.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            openImageView.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor),
            conteinerView.trailingAnchor.constraint(equalTo: openImageView.trailingAnchor, constant: 15),
            openImageView.widthAnchor.constraint(equalToConstant: 15),
            openImageView.heightAnchor.constraint(equalToConstant: 15)
        ])
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 15),
            stackView.topAnchor.constraint(equalTo: conteinerView.topAnchor, constant: 15),
            conteinerView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 15),
            openImageView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor,constant: 15)
        ])
    }
    
    private func configureImageView() {
        userImageView.layer.borderWidth = 1
        userImageView.layer.masksToBounds = false
        userImageView.layer.cornerRadius = 25
        userImageView.clipsToBounds = true

    }

}
