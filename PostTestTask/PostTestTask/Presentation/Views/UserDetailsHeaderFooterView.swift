//
//  UserDetailsHeaderFooterView.swift
//  PostTestTask
//
//  Created by Igor Poliukhovych on 23.11.2022.
//

import UIKit

class UserDetailsHeaderFooterView: UITableViewHeaderFooterView {
    static let identifier = "UserDetailsHeaderFooterView"
    let imageView = UIImageView()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 20
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureContents() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    func configureImageView(with stringUrl: String) {
        let url = URL(string: stringUrl)
        imageView.contentMode = .scaleAspectFill
        imageView.downloadImage(from: url)
    }
    
}
