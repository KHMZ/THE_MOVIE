//
//  Movie.swift
//  TheMovie
//
//  Created by Macbook Pro on 14/06/2021.
//

import Foundation
import UIKit
import ObjectMapper
import RealmSwift

class Movie: Object,Mappable {
    
    @objc dynamic var adult: Bool = true
    @objc dynamic var backdrop_path: String?
    @objc dynamic var id = 0
    @objc dynamic var original_language: String?
    @objc dynamic var original_title: String?
    @objc dynamic var overview: String?
    @objc dynamic var popularity = 0
    @objc dynamic var poster_path: String?
    @objc dynamic var release_date: String?
    @objc dynamic var title: String?
    @objc dynamic var video: Bool = true
    @objc dynamic var vote_average = 0
    @objc dynamic var vote_count = 0
    @objc dynamic var isUpcoming: Bool = false
    @objc dynamic var isPopular: Bool = false
    @objc dynamic var isFavourite: Bool = false
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map)
    {
        adult <- map["adult"]
        backdrop_path <- map["backdrop_path"]
        id <- map["id"]
        original_language <- map["original_language"]
        original_title <- map["original_title"]
        overview <- map["overview"]
        popularity <- map["popularity"]
        poster_path <- map["poster_path"]
        release_date <- map["release_date"]
        title <- map["title"]
        video <- map["video"]
        vote_average <- map["vote_average"]
        vote_count <- map["vote_count"]

    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
