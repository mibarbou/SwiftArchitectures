//
//  MovieDetailInteractor.swift
//  Project: MoviesVIPER
//
//  Module: MovieDetail
//
//  By Michel Barbou Salvador 11/08/2018
//  mibarbou 2018
//

import Foundation
import SwiftyVIPER

protocol MovieDetailPresenterInteractorProtocol {
	func requestTitle()
}

final class MovieDetailInteractor: MovieDetailPresenterInteractorProtocol {
    
    let movie: Movie

	weak var presenter: MovieDetailInteractorPresenterProtocol?
    
    init(movie: Movie) {
        self.movie = movie
    }

	func requestTitle() {
		presenter?.set(title: movie.title)
	}
}
