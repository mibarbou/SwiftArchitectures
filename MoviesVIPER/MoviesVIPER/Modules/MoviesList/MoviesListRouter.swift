//
//  MoviesListRouter.swift
//  Project: MoviesVIPER
//
//  Module: MoviesList
//
//  By Michel Barbou Salvador 11/08/2018
//  mibarbou 2018
//

import UIKit

import SwiftyVIPER


protocol MoviesListPresenterRouterProtocol: PresenterRouterProtocol {
    func goToMovieDetail(_ movie: Movie)
}

final class MoviesListRouter: RouterProtocol, MoviesListPresenterRouterProtocol {

	weak var viewController: UIViewController?
    
    func goToMovieDetail(_ movie: Movie) {
        MovieDetailModule(movie: movie).push(from: viewController?.navigationController)
    }
}
