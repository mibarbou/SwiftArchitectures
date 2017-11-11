//
//  Endpoint.swift
//  MoviesVIPER
//
//  Created by Michel Barbou Salvador on 11/11/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import Foundation
import Alamofire


fileprivate let baseURL: String = "https://api.themoviedb.org/3"
fileprivate let apiKey = "ee766114fac96c095115b978f23a709b"

enum Endpoint {
    case movie(id: String)
}

//MARK: - method
extension Endpoint {
    var method: Alamofire.HTTPMethod {
        switch self {
        case .movie:
            return .get
        }
    }
}

//MARK: - path
extension Endpoint {
    var path: String {
        switch self {
        case let .movie(id: id):
            return baseURL + "/movie/" + id

        }
    }
}

//MARK: - parameters
extension Endpoint {
    var parameters: [String : String] {
        switch self {
        case .movie:
            return ["api_key": apiKey]
        }
    }
}
