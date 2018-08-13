//
//  MoviesListPresenter.swift
//  Project: MoviesVIPER
//
//  Module: MoviesList
//
//  By Michel Barbou Salvador 11/08/2018
//  mibarbou 2018
//

import UIKit
import SwiftyVIPER

protocol MoviesListViewPresenterProtocol: ViewPresenterProtocol {
    func moviesCount() -> Int
    func movie(at index: IndexPath) -> Movie
    func goToMovieDetail(_ movie: Movie)
}

protocol MoviesListInteractorPresenterProtocol: class {
	func set(title: String?)
    func load(movies: [Movie])
}


final class MoviesListPresenter {

	let router: MoviesListPresenterRouterProtocol
	let interactor: MoviesListPresenterInteractorProtocol

	weak var view: MoviesListPresenterViewProtocol?
    
    var movies: [Movie] = []

	init(router: MoviesListPresenterRouterProtocol, interactor: MoviesListPresenterInteractorProtocol) {
		self.router = router
		self.interactor = interactor
	}
}

extension MoviesListPresenter: MoviesListViewPresenterProtocol {
    
    func viewLoaded() {
        interactor.requestTitle()
        interactor.fetchMovies()
    }
    
    func movie(at index: IndexPath) -> Movie {
        return movies[index.row]
    }
    
    func moviesCount() -> Int {
        return movies.count
    }
    
    func goToMovieDetail(_ movie: Movie) {
        router.goToMovieDetail(movie)
    }

}

extension MoviesListPresenter: MoviesListInteractorPresenterProtocol {
    
    func load(movies: [Movie]) {
        self.movies = movies
        view?.reload()
    }


    
    func set(title: String?) {
        view?.set(title: title)
    }
    
}
