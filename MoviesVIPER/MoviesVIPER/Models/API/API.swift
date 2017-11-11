//
//  MoviesAPI.swift
//  MoviesVIPER
//
//  Created by Michel Barbou Salvador on 11/11/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import Foundation
import Alamofire

class API {
    
    static let manager: SessionManager = {
        return Alamofire.SessionManager.default
    }()
    
    static let headers = ["Content-type": "application/x-www-form-urlencoded"]
    
    fileprivate static func request(endpoint: Endpoint,
                                    success: @escaping ([String : Any])->(),
                                    fail: @escaping (ApiError)->()) {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        let _ = API.manager.request(endpoint.path,
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


extension API {
    
    public static func popularMovies(success: @escaping ([String : Any])->(), fail: @escaping (ApiError)->()) {
        self.request(endpoint: .popularMovies, success: { (movies) in
            
        }) { (error) in
            print(error)
        }
    }
    
    public static func nowPlayingMovies(success: @escaping ([String : Any])->(), fail: @escaping (ApiError)->()) {
        self.request(endpoint: .nowPlayingMovies, success: { (movies) in
            
        }) { (error) in
            print(error)
        }
    }
    
    public static func topRatedMovies(success: @escaping ([String : Any])->(), fail: @escaping (ApiError)->()) {
        self.request(endpoint: .topRatedMovies, success: { (movies) in
            
        }) { (error) in
            print(error)
        }
    }
    
    public static func upcomingMovies(success: @escaping ([String : Any])->(), fail: @escaping (ApiError)->()) {
        self.request(endpoint: .upcomingMovies, success: { (movies) in
            
        }) { (error) in
            print(error)
        }
    }
    
    public static func latestMovies(success: @escaping ([String : Any])->(), fail: @escaping (ApiError)->()) {
        self.request(endpoint: .latestMovies, success: { (movies) in
            
        }) { (error) in
            print(error)
        }
    }
    
    public static func movie(id: String,
                             success: @escaping ([String : Any])->(),
                             fail: @escaping (ApiError)->()) {
        
        self.request(endpoint: .movie(id: id), success: { (movie) in
            
        }) { (error) in
            print(error)
        }
    }
    
    public static func movieImages(id: String,
                             success: @escaping ([String : Any])->(),
                             fail: @escaping (ApiError)->()) {
        
        self.request(endpoint: .movieImages(id: id), success: { (movie) in
            
        }) { (error) in
            print(error)
        }
    }
    
    public static func movieVideos(id: String,
                                   success: @escaping ([String : Any])->(),
                                   fail: @escaping (ApiError)->()) {
        
        self.request(endpoint: .movieVideos(id: id), success: { (movie) in
            
        }) { (error) in
            print(error)
        }
    }
    
    public static func similarMovies(id: String,
                                   success: @escaping ([String : Any])->(),
                                   fail: @escaping (ApiError)->()) {
        
        self.request(endpoint: .similarMovies(id: id), success: { (movie) in
            
        }) { (error) in
            print(error)
        }
    }
    
    public static func movieReviews(id: String,
                                     success: @escaping ([String : Any])->(),
                                     fail: @escaping (ApiError)->()) {
        
        self.request(endpoint: .movieReviews(id: id), success: { (movie) in
            
        }) { (error) in
            print(error)
        }
    }
    
    public static func moviesGenres(success: @escaping ([String : Any])->(), fail: @escaping (ApiError)->()) {
        self.request(endpoint: .moviesGenres, success: { (movies) in
            
        }) { (error) in
            print(error)
        }
    }
    
    public static func genreMovies(id: String,
                                    success: @escaping ([String : Any])->(),
                                    fail: @escaping (ApiError)->()) {
        
        self.request(endpoint: .genreMovies(id: id), success: { (movie) in
            
        }) { (error) in
            print(error)
        }
    }
    
    public static func movieSearch(query: String,
                                   success: @escaping ([String : Any])->(),
                                   fail: @escaping (ApiError)->()) {
        
        self.request(endpoint: .movieSearch(query: query), success: { (movie) in
            
        }) { (error) in
            print(error)
        }
    }
}






