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
    case getImages(pageNumber: Int)
}

extension ALphaNetworking: TargetType {
    var baseURL: String {
        switch self {
        default:
            return "https://picsum.photos"
        }
    }
    
    var path: String {
        switch self {
        case .getImages(pageNumber: let pageNumber):
            return "/v2/list?page=\(pageNumber)&limit=10"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getImages:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getImages:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
        }
    }
}
