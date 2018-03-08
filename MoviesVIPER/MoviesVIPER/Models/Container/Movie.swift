//
//  Movie.swift
//  MoviesVIPER
//
//  Created by Michel Barbou Salvador on 08/03/2018.
//  Copyright © 2018 mibarbou. All rights reserved.
//

import Foundation
import RealmSwift

class Movie: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var title: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

