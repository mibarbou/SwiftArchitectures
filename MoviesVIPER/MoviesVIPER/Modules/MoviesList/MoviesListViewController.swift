//
//  MoviesListViewController.swift
//  Project: MoviesVIPER
//
//  Module: MoviesList
//
//  By Michel Barbou Salvador 11/08/2018
//  mibarbou 2018
//

import UIKit
import SwiftyVIPER

protocol MoviesListPresenterViewProtocol: class {
	func set(title: String?)
    func reload()
}

class MoviesListViewController: UITableViewController {

	let presenter: MoviesListViewPresenterProtocol

	init(presenter: MoviesListViewPresenterProtocol) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
    	super.viewDidLoad()
        setup()
		presenter.viewLoaded()
        
    }
    
    func setup() {
        let nib = UINib(nibName: MovieCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: MovieCell.identifier)
    }
}

extension MoviesListViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.moviesCount()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.identifier, for: indexPath) as! MovieCell
        cell.titleLabel?.text = presenter.movie(at: indexPath).title
        return cell
    }
}

extension MoviesListViewController: MoviesListPresenterViewProtocol {
    func reload() {
        self.tableView.reloadData()
    }
    
    func set(title: String?) {
        self.title = title
    }
}
