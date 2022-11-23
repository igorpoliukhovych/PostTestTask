//
//  ParameterEncoding.swift
//  PostTestTask
//
//  Created by Igor Poliukhovych on 23.11.2022.
//

import Foundation

public typealias Parameters = [String:Any]

public protocol ParameterEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}
