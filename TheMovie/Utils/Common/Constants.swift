//
//  Constants.swift
//  TheMovie
//
//  Created by Macbook Pro on 14/06/2021.
//

import Foundation

class Constants {
    //API
    public static var APIKEY = "f34aa9daf8639936df8a4da3aa440e7e"
    public static var UPCOMING = "https://api.themoviedb.org/3/movie/upcoming?api_key=\(APIKEY)"
    public static var POPULAR = "https://api.themoviedb.org/3/movie/popular?api_key=\(APIKEY)"
    
    //IMAGE
    public static var BASE_IMAGE_LINK = "https://www.themoviedb.org/t/p/w1280/"
    
    //COLLECTION_HEADER
    public static var UPCOMING_TITLE = "UPCOMING"
    public static var POPULAR_TITLE = "What's Popular!"
    
    //NetworkError
    public static var NETWORKERROR = "NETWORK ERROR"
    public static var CANNOTCONNECT_TOSERVER = "Cannot connect to server."
    public static var SOMETHING_WRONG = "Something went wrong."
    public static var OK = "OK"
    
    public static var PLACEHOLDER_ICON = "Placeholder"
   
    public static var MOVIE_DETAIL_STORYBOARD = "MovieDetail"
    public static var MOVIE_DETAIL_IDENTIFIER = "moviedetailID"
    
    public static var GENERIC = "Horror,Sci-Fi & Fantasy, Action & Adventure, Drama"
    public static var OVERVIEW = "Overview"
    
    
}
