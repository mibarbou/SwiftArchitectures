//
//  MovieMapper.swift
//  MoviesVIPER
//
//  Created by Michel Barbou Salvador on 03/12/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import Foundation

struct MovieMapper: Mapper {
    typealias IN = MovieResponse
    typealias OUT = Movie
    
    func map(input: MovieResponse) -> Movie {
        return Movie(id: input.id,
                     title: input.title)
    }
}
