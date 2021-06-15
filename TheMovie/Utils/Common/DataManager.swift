//
//  DataManager.swift
//  TheMovie
//
//  Created by Macbook Pro on 14/06/2021.
//

import Foundation
import RealmSwift

class DataManger {
    let realm = try! Realm()
    
    func getPopularfromRealm() -> [Movie]?{
        let info = realm.objects(Movie.self).filter("isPopular = true")
        return Array(info)
    }
    
    func getUpcomingfromRealm() -> [Movie]{
        let info = realm.objects(Movie.self).filter("isUpcoming = true")
        return Array(info)
    }
    
    func savePopularMovies(movies: Movies){
        try! realm.write {
            realm.add(movies.changeIsPopular(isPopular: true),update: .all)
        }
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    func saveUpcomingMovies(movies: Movies){
        try! realm.write {
            realm.add(movies.changeIsUpcoming(isUpComing: true),update: .all)
        }
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    func setFavourite(movie: Movie){
        try! realm.write {
            movie.isFavourite = !movie.isFavourite
            realm.add(movie, update: .all)
            }
    }
}
