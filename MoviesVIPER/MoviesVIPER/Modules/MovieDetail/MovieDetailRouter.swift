//
//  MovieDetailRouter.swift
//  Project: MoviesVIPER
//
//  Module: MovieDetail
//
//  By Michel Barbou Salvador 11/08/2018
//  mibarbou 2018
//

import UIKit

import SwiftyVIPER


protocol MovieDetailPresenterRouterProtocol: PresenterRouterProtocol {

}

final class MovieDetailRouter: RouterProtocol, MovieDetailPresenterRouterProtocol {

	weak var viewController: UIViewController?
}
