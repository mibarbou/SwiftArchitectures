//
//  MovieService.swift
//  MoviesVIPER
//
//  Created by Michel Barbou Salvador on 08/03/2018.
//  Copyright © 2018 mibarbou. All rights reserved.
//

import Foundation
import RealmSwift

class MovieService {
    fileprivate lazy var movieContainer = {
        return MovieContainer(name: "movies")
    }()
    
    func moviesCount() -> Int {
        return fetchMovies().count
    }
    
    func fetchMovies() -> Results<Movie> {
        fetchMoviesFromRemote()
        return movieContainer.fetchMovies()
    }
    
    fileprivate func fetchMoviesFromRemote() {
        API.popularMovies(success: { movieList in
            let movies = movieList.movies
            self.movieContainer.save(movies: movies)
        }) { error in
            
        }
    }
    
    func reloadData(callback: @escaping ()->()) {
        movieContainer.updatedDataNotification {
            callback()
        }
    }
    
}
