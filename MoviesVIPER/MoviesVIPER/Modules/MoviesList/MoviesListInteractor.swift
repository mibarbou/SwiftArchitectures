//
//  MoviesListInteractor.swift
//  Project: MoviesVIPER
//
//  Module: MoviesList
//
//  By Michel Barbou Salvador 11/08/2018
//  mibarbou 2018
//

import Foundation
import SwiftyVIPER

protocol MoviesListPresenterInteractorProtocol {
	func requestTitle()
    func fetchMovies()
}

final class MoviesListInteractor: MoviesListPresenterInteractorProtocol {

	weak var presenter: MoviesListInteractorPresenterProtocol?
    
    let service: MovieService
    
    init(service: MovieService) {
        self.service = service
    }

	func requestTitle() {
		presenter?.set(title: "Popular Movies")
	}
    
    func fetchMovies() {
        let movies = service.fetchMovies().toArray(type: Movie.self)
        self.presenter?.load(movies: movies)
        service.reloadData {
            self.presenter?.load(movies: movies)
            self.presenter?.reloadData()
        }
    }
}
