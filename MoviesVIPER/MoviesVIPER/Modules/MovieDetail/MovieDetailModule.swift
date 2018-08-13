//
//  MovieDetailModule.swift
//  Project: MoviesVIPER
//
//  Module: MovieDetail
//
//  By Michel Barbou Salvador 11/08/2018
//  mibarbou 2018
//

import SwiftyVIPER
import UIKit

final class MovieDetailModule: ModuleProtocol {
    
    let movie: Movie

	private(set) lazy var interactor: MovieDetailInteractor = {
		MovieDetailInteractor(movie: self.movie)
	}()

	private(set) lazy var router: MovieDetailRouter = {
		MovieDetailRouter()
	}()

	private(set) lazy var presenter: MovieDetailPresenter = {
		MovieDetailPresenter(router: self.router, interactor: self.interactor)
	}()

	private(set) lazy var view: MovieDetailViewController = {
		MovieDetailViewController(presenter: self.presenter)
	}()

	var viewController: UIViewController {
		return view
	}

    init(movie: Movie) {
        self.movie = movie
		presenter.view = view
		router.viewController = view
		interactor.presenter = presenter
	}
}
