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

}

final class MoviesListRouter: RouterProtocol, MoviesListPresenterRouterProtocol {

	weak var viewController: UIViewController?
}
