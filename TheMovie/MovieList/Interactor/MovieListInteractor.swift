//
//  MovieListInteractor.swift
//  TheMovie
//
//  Created by Macbook Pro on 14/06/2021.
//

import Foundation
import ObjectMapper
import Alamofire

class MovieListInteractor: MovieListPresenterToInteractorProtocols {
    var MovieListInteractorToPresenterProtocols: MovieListInteractorToPresenterProtocols?
    
    func fetchUpcomingMovieList() {
        
        // 1
        let request = AF.request(Constants.UPCOMING)
        // 2
        request.responseJSON { (data) in
            
            do {
                switch data.result {
                case .success:
                    if let data = data.value {
                        do {
                            //                                print("GETREQUEST ==> \(data)") //JSONRESPONSE
                            let movies = Mapper<Movies>().map(JSONObject: data)
                            print("TOTAL PAGES::::", movies?.total_pages)
                            if movies != nil{
                                self.MovieListInteractorToPresenterProtocols?.UpcomingMovieListFetchedSuccess(MovieListObj: movies!)
                                
                            }
                        } catch let error {
                            //                                print("JSON Error ==> \(error)")
                           
                        }
                    } else {
                      print("Something went wrong.")
                    }
                    break
                case .failure(let error):
                    print(error)
                    break
                }
               
            } catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
            
        }
    }
    
    func fetchPopularMovie() {
        
        // 1
        let request = AF.request(Constants.POPULAR)
        // 2
        request.responseJSON { (data) in
            
            do {
                switch data.result {
                case .success:
                    if let data = data.value {
                        do {
                            //                                print("GETREQUEST ==> \(data)") //JSONRESPONSE
                            let movies = Mapper<Movies>().map(JSONObject: data)
                           
                            if movies != nil{
                                self.MovieListInteractorToPresenterProtocols?.PopularMovieFetchedSuccess(MovieObj: movies!)
                            }
                        } catch let error {
                            //                                print("JSON Error ==> \(error)")
                           
                        }
                    } else {
                      print("Something went wrong.")
                    }
                    break
                case .failure(let error):
                    print(error)
                    break
                }
               
            } catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
            
        }
    }
    
}
