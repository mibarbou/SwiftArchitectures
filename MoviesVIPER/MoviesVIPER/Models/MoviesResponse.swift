//
//  MoviesResponse.swift
//  MoviesVIPER
//
//  Created by Michel Barbou on 20/11/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import Gloss

struct MoviesResponse: Gloss.Decodable {
	let page:			Int?
	let totalResults:	Int?
	let totalPages:		Int?
	let results:		[MovieResponse]?
	
	init?(json: JSON) {
		self.page = "page" <~~ json
		self.totalResults = "total_results" <~~ json
		self.totalPages = "total_pages" <~~ json
		guard let moviesJSON: [JSON] = "results" <~~ json else {
			self.results = [MovieResponse]()
			return
		}
		self.results = [MovieResponse].from(jsonArray: moviesJSON)
	}
}
