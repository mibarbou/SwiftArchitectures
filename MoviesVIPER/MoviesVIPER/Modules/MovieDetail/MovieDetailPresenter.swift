//
//  MovieDetailPresenter.swift
//  Project: MoviesVIPER
//
//  Module: MovieDetail
//
//  By Michel Barbou Salvador 11/08/2018
//  mibarbou 2018
//

import UIKit
import SwiftyVIPER

protocol MovieDetailViewPresenterProtocol: ViewPresenterProtocol {

}

protocol MovieDetailInteractorPresenterProtocol: class {
	func set(title: String?)
}


final class MovieDetailPresenter {

	let router: MovieDetailPresenterRouterProtocol
	let interactor: MovieDetailPresenterInteractorProtocol

	weak var view: MovieDetailPresenterViewProtocol?

	init(router: MovieDetailPresenterRouterProtocol, interactor: MovieDetailPresenterInteractorProtocol) {
		self.router = router
		self.interactor = interactor
	}
}

extension MovieDetailPresenter: MovieDetailViewPresenterProtocol {
    func viewLoaded() {
        interactor.requestTitle()
    }
}

extension MovieDetailPresenter: MovieDetailInteractorPresenterProtocol {
    func set(title: String?) {
        view?.set(title: title)
    }
}
