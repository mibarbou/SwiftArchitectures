//
//  MoviesListMapper.swift
//  MoviesVIPER
//
//  Created by Michel Barbou Salvador on 03/12/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import Foundation

struct MoviesListMapper: Mapper {
    typealias IN = MoviesResponse
    typealias OUT = MoviesList
    let movieMapper = MovieMapper()
    
    func map(input: MoviesResponse) -> MoviesList {
        let moviesResponse = input.results ?? []
        let movies = moviesResponse.map{ movieMapper.map(input: $0) }
        
        return MoviesList(page: input.page ?? 0,
                          totalResults: input.totalResults ?? 0,
                          totalPages: input.totalPages ?? 0,
                          movies: movies)
    }
}
