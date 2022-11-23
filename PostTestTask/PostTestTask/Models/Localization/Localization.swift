//
//  Localization.swift
//  PostTestTask
//
//  Created by Igor Poliukhovych on 23.11.2022.
//

import Foundation

enum Localization { }

protocol LocalizationCase {
    static var key: String { get }
}

extension LocalizationCase {
    static var key: String { return String(describing: self).lowercased() }
}
