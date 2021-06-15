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
            for each in movies.results {
                let info = realm.objects(Movie.self).filter("id = \(each.id)").first
                
                if info != nil {
                    try! realm.write {
                        info?.isPopular = true
                        realm.add(info ?? each,update: .modified)
                    }
                }else{
                    try! realm.write {
                        each.isPopular = true
                        realm.add(each,update: .modified)
                    }
                }
            }
        }
        
        func saveUpcomingMovies(movies: Movies){
            for each in movies.results {
                let info = realm.objects(Movie.self).filter("id = \(each.id)").first
                
                if info != nil {
                    try! realm.write {
                        info?.isUpcoming = true
                        realm.add(info ?? each,update: .modified)
                    }
                }else{
                    try! realm.write {
                        each.isUpcoming = true
                        realm.add(each,update: .modified)
                    }
                }
            }
        }
    
    func setFavourite(movie: Movie){
        try! realm.write {
            movie.isFavourite = !movie.isFavourite
            realm.add(movie, update: .all)
            }
    }
}
