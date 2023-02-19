//
//  UsersNetworking.swift
//  NetworkLayer
//
//  Created by Ahmed masoud on 5/21/20.
//  Copyright © 2020 Ahmed Masoud. All rights reserved.
//

import Foundation
import Alamofire

enum ALphaNetworking {
    case getToken(username: String, password: String, grant_type: String, scope: String, client_id: String, client_secret: String)
}

extension ALphaNetworking: TargetType {
    var baseURL: String {
        switch self {
        default:
            return "https://development.iam.api.alpha.creditfins.com"
        }
    }
    
    var path: String {
        switch self {
        case .getToken:
            return "/oauth/token"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getToken:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .getToken(let username, let password, let grant_type, let scope, let client_id, let client_secret):
            return .requestParameters(parameters: ["username": username, "password": password, "grant_type": grant_type, "scope": scope, "client_id": client_id, "client_secret": client_secret], encoding: URLEncoding.httpBody)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
        }
    }
}
