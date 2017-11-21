//
//  MovieResponse.swift
//  MoviesVIPER
//
//  Created by Michel Barbou on 20/11/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import Gloss

struct MovieResponse: Gloss.Decodable {
	let voteCount:			Int?
	let id:					Int
	let video:				Bool?
	let voteAverage:		Double?
	let title:				String
	let popularity:			Double?
	let posterPath:			String?
	let originalLanguage:	String?
	let originalTitle:		String?
	let genreIds:			[Int]?
	let backdropPath:		String?
	let adult:				Bool?
	let overview:			String?
	let releaseDate:		String?
	
	init?(json: JSON) {
		self.voteCount = "vote_count" <~~ json
		guard let id: Int = "id" <~~ json else { return nil }
		self.id = id
		self.video = "video" <~~ json
		self.voteAverage = "vote_average" <~~ json
		guard let title: String = "title" <~~ json else { return nil }
		self.title = title
		self.popularity = "popularity" <~~ json
		self.posterPath = "poster_path" <~~ json
		self.originalLanguage = "original_language" <~~ json
		self.originalTitle = "original_title" <~~ json
		self.genreIds = "genre_ids" <~~ json
		self.backdropPath = "backdrop_path" <~~ json
		self.adult = "adult" <~~ json
		self.overview = "overview" <~~ json
		self.releaseDate = "release_date" <~~ json
	}
}
