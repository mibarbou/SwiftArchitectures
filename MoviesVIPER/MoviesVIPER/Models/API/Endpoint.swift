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
    case popularMovies
    case nowPlayingMovies
    case topRatedMovies
    case upcomingMovies
    case latestMovies
    case movie(id: String)
    case movieImages(id: String)
    case movieVideos(id: String)
    case similarMovies(id: String)
    case movieReviews(id: String)
    case moviesGenres
    case genreMovies(id: String)
    case movieSearch(query: String)
}

//MARK: - method
extension Endpoint {
    var method: Alamofire.HTTPMethod {
        switch self {
        case .popularMovies, .nowPlayingMovies, .topRatedMovies, .upcomingMovies, .latestMovies, .movie,
             .movieImages, .movieVideos, .similarMovies, .movieReviews, .moviesGenres, .genreMovies, .movieSearch:
            return .get
        }
    }
}

//MARK: - path
extension Endpoint {
    var path: String {
        switch self {
        case .popularMovies:
            return baseURL + "/movie/popular"
        case .nowPlayingMovies:
            return baseURL + "/movie/now_playing"
        case .topRatedMovies:
            return baseURL + "/movie/top_rated"
        case .upcomingMovies:
            return baseURL + "/movie/upcoming"
        case .latestMovies:
            return baseURL + "/movie/latest"
        case let .movie(id: id):
            return baseURL + "/movie/" + id
        case let .movieImages(id: id):
            return baseURL + "/movie/" + id + "/images"
        case let .movieVideos(id: id):
            return baseURL + "/movie/" + id + "/videos"
        case let .similarMovies(id: id):
            return baseURL + "/movie/" + id + "/similar"
        case let .movieReviews(id: id):
            return baseURL + "/movie/" + id + "/reviews"
        case .moviesGenres:
            return baseURL + "/genres/movie/list"
        case let .genreMovies(id: id):
            return baseURL + "/genre/" + id + "/movies"
        case .movieSearch:
            return baseURL + "/search/movie"
        }
    }
}

//MARK: - parameters
extension Endpoint {
    var parameters: [String : String] {
        switch self {
        case .popularMovies, .nowPlayingMovies, .topRatedMovies, .upcomingMovies, .latestMovies, .movie, 
             .movieImages, .movieVideos, .similarMovies, .movieReviews, .moviesGenres, .genreMovies:
            return ["api_key": apiKey]
        case let .movieSearch(query: q):
            return ["api_key": apiKey,
                    "query": q]
        }
    }
}
