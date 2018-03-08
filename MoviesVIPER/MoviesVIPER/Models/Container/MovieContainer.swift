//
//  MovieContainer.swift
//  MoviesVIPER
//
//  Created by Michel Barbou Salvador on 08/03/2018.
//  Copyright © 2018 mibarbou. All rights reserved.
//

import Foundation
import RealmSwift

final public class MovieContainer {
    fileprivate let container: Realm
    fileprivate var notificationToken: NotificationToken? = nil
    init(name: String) {
        var config = Realm.Configuration()
        // Use the default directory, but replace the filename with the username
        config.fileURL = config.fileURL!.deletingLastPathComponent().appendingPathComponent("\(name).realm")
        // Set this as the configuration used for the default Realm
        Realm.Configuration.defaultConfiguration = config
        self.container = try! Realm(configuration: config)
    }
    
    init(testName: String) {
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = testName
        self.container = try! Realm()
    }
    
    deinit {
        notificationToken?.invalidate()
    }
    
    func fetchMovies() -> Results<Movie> {
        return self.container.objects(Movie.self)
    }
    
    func save(movies: [Movie]) {
        try! container.write {
            container.add(movies, update: true)
        }
    }
    
    func deleteAll() {
        try! container.write {
            container.deleteAll()
        }
    }
    
    func updatedDataNotification(callback: @escaping ()->()) {
        self.notificationToken = container.observe({ (notif, realm) in
            callback()
        })
    }

}
