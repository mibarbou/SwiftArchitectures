//
//  MovieDetailResponse.swift
//  MoviesVIPER
//
//  Created by Michel Barbou Salvador on 21/11/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import Gloss

struct MovieDetailResponse: JSONDecodable {
    let id:                     Int
    let title:                  String
    let adult:                  Bool?
    let backdropPath:           String?
    let belongsToCollection:    [CollectionResponse]?
    let budget:                 Int?
    let homepage:               String?
    let imbdId:                 String?
    let originalLanguage:       String?
    let originalTitle:          String?
    let overview:               String?
    let popularity:             Double?
    let posterPath:             String?
    let productionCompanies:    [ProductionCompanyResponse]?
    let productionCountries:    [ProductionCountryResponse]?
    let releaseDate:            String?
    let revenue:                Int?
    let runtime:                Int?
    let spokenLanguages:        [SpokenLanguageResponse]?
    let status:                 String?
    let tagline:                String?
    let video:                  Bool?
    let voteAverage:            Double?
    let voteCount:              Int?
    
    init?(json: JSON) {
        guard let id: Int = "id" <~~ json else { return nil }
        self.id = id
        guard let title: String = "title" <~~ json else { return nil }
        self.title = title
        self.adult = "adult" <~~ json
        self.backdropPath = "backdrop_path" <~~ json
        self.belongsToCollection = "belongs_to_collection" <~~ json
        self.budget = "budget" <~~ json
        self.homepage = "homepage" <~~ json
        self.imbdId = "imbd_id" <~~ json
        self.originalLanguage = "original_language" <~~ json
        self.originalTitle = "original_title" <~~ json
        self.overview = "overview" <~~ json
        self.popularity = "popularity" <~~ json
        self.posterPath = "poster_path" <~~ json
        self.productionCompanies = "production_companies" <~~ json
        self.productionCountries = "production_countries" <~~ json
        self.releaseDate = "release_date" <~~ json
        self.revenue = "revenue" <~~ json
        self.runtime = "runtime" <~~ json
        self.spokenLanguages = "spoken_languages" <~~ json
        self.status = "status" <~~ json
        self.tagline = "tagline" <~~ json
        self.video = "video" <~~ json
        self.voteAverage = "vote_average" <~~ json
        self.voteCount = "vote_count" <~~ json
    }
}

struct CollectionResponse: JSONDecodable {
    let name:           String
    let id:             Int
    let posterPath:     String?
    let backdropPath:   String?

    init?(json: JSON) {
        guard let name: String = "name" <~~ json else { return nil }
        self.name = name
        guard let id: Int = "id" <~~ json else { return nil }
        self.id = id
        self.posterPath = "poster_path" <~~ json
        self.backdropPath = "backdrop_path" <~~ json
    }
}


struct ProductionCompanyResponse: JSONDecodable {
    let name:   String
    let id:     Int
    
    init?(json: JSON) {
        guard let name: String = "name" <~~ json else { return nil }
        self.name = name
        guard let id: Int = "id" <~~ json else { return nil }
        self.id = id
    }
}

struct ProductionCountryResponse: JSONDecodable {
    let name:   String
    let isoCode:    String
    
    init?(json: JSON) {
        guard let name: String = "name" <~~ json else { return nil }
        self.name = name
        guard let isoCode: String = "iso_3166_1" <~~ json else { return nil }
        self.isoCode = isoCode
    }
}

struct SpokenLanguageResponse: JSONDecodable {
    let name:   String
    let isoCode:    String
    
    init?(json: JSON) {
        guard let name: String = "name" <~~ json else { return nil }
        self.name = name
        guard let isoCode: String = "iso_639_1" <~~ json else { return nil }
        self.isoCode = isoCode
    }
}













