//
//  MainEndPoint.swift
//  PostTestTask
//
//  Created by Igor Poliukhovych on 23.11.2022.
//

import Foundation

public enum ReqeustApi: EndPointType {
    
    case users
    case posts
    
    var baseURL: URL {
        guard let url = URL(string: "https://my-json-server.typicode.com/SharminSirajudeen/test_resources" ) else { fatalError("baseURL could not be configured.") }
        return url
    }
    
    var path: String {
        switch self {
        case .users:
            return "users"
        case .posts:
            return "posts"
        }
    }
    
    var httpMethod: HTTPMethod {
        .get
    }
    
    var task: HTTPTask {
        return .request
    }
    
}
