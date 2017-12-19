//
//  Mapper.swift
//  MoviesVIPER
//
//  Created by Michel Barbou Salvador on 03/12/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import Foundation


protocol Mapper {
    associatedtype IN
    associatedtype OUT
    func map(input: IN) -> OUT
}
