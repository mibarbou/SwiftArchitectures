//
//  MovieDetailViewController.swift
//  Project: MoviesVIPER
//
//  Module: MovieDetail
//
//  By Michel Barbou Salvador 11/08/2018
//  mibarbou 2018
//

import UIKit
import SwiftyVIPER

protocol MovieDetailPresenterViewProtocol: class {
	func set(title: String?)
}

class MovieDetailViewController: UIViewController {
    
	let presenter: MovieDetailViewPresenterProtocol

	init(presenter: MovieDetailViewPresenterProtocol) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
    	super.viewDidLoad()
		presenter.viewLoaded()

		view.backgroundColor = .white
    }
}

extension MovieDetailViewController: MovieDetailPresenterViewProtocol {
    func set(title: String?) {
        self.title = title
    }
}
