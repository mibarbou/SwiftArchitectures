//
//  MoviesListModule.swift
//  Project: MoviesVIPER
//
//  Module: MoviesList
//
//  By Michel Barbou Salvador 11/08/2018
//  mibarbou 2018
//

import SwiftyVIPER
import UIKit

final class MoviesListModule: ModuleProtocol {

	private(set) lazy var interactor: MoviesListInteractor = {
		MoviesListInteractor(service: MovieService())
	}()

	private(set) lazy var router: MoviesListRouter = {
		MoviesListRouter()
	}()

	private(set) lazy var presenter: MoviesListPresenter = {
		MoviesListPresenter(router: self.router, interactor: self.interactor)
	}()

	private(set) lazy var view: MoviesListViewController = {
		MoviesListViewController(presenter: self.presenter)
	}()

	var viewController: UIViewController {
		return view
	}

	init() {
		presenter.view = view
		router.viewController = view
		interactor.presenter = presenter
	}
}
