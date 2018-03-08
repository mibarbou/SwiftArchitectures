//
//  HomeViewController.swift
//  MoviesVIPER
//
//  Created by Michel Barbou Salvador on 08/03/2018.
//  Copyright © 2018 mibarbou. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        MovieService().reloadData {
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup() {
        let nib = UINib(nibName: MovieCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: MovieCell.identifier)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MovieService().moviesCount()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.identifier, for: indexPath) as! MovieCell
        let movie = MovieService().fetchMovies()[indexPath.row]
        cell.titleLabel.text = movie.title
        return cell
    }
}

