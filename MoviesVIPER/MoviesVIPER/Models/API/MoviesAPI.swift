//
//  MoviesAPI.swift
//  MoviesVIPER
//
//  Created by Michel Barbou Salvador on 11/11/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import Foundation
import Alamofire

class MoviesAPI {
    
    static let manager: SessionManager = {
        return Alamofire.SessionManager.default
    }()
    
    static let headers = ["Content-type": "application/x-www-form-urlencoded"]
    
    fileprivate static func request(endpoint: Endpoint,
                                    success: @escaping ([String : Any])->(),
                                    fail: @escaping (ApiError)->()) {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        let _ = MoviesAPI.manager.request(endpoint.path,
                                          method: endpoint.method,
                                          parameters: endpoint.parameters,
                                          encoding: URLEncoding.default,
                                          headers: headers).responseJSON { (response) in
                                            
                                            switch response.result {
                                            case .success(let json):
                                                guard let theJson = json as? [String : Any] else {
                                                    fail(.parserError)
                                                    return
                                                }
                                                debugPrint(theJson)
                                                success(theJson)
                                            case .failure(let error):
                                                print("Request failed with error: \(error)")
                                                if let errorCode = response.error?._code,
                                                    Int(errorCode) == -1009{
                                                    fail(ApiError.noConnection)
                                                } else {
                                                    fail(ApiError.defaultError)
                                                }
                                            }
        }
    }
}


extension MoviesAPI {
    
    public static func movie(id: String,
                             success: @escaping ([String : Any])->(),
                             fail: @escaping (ApiError)->()) {
        
        self.request(endpoint: .movie(id: id), success: { (movie) in
            
        }) { (error) in
            print(error)
        }
    }
}






