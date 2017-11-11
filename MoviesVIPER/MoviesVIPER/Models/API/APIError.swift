//
//  APIError.swift
//  MoviesVIPER
//
//  Created by Michel Barbou Salvador on 11/11/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import Foundation

enum ApiError :Error {
    case serverError(message: String)
    case defaultError
    case parserError
    case noConnection
}
