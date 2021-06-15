//
//  MovieListProtocol.swift
//  TheMovie
//
//  Created by Macbook Pro on 14/06/2021.
//


import Foundation

protocol MovieListViewToPresenterProtocols: class {
    var view: MovieListPresenterToViewProtocols? {get set}
    var router: MovieListPresenterToRouterProtocols? {get set}
    var interactor: MovieListPresenterToInteractorProtocols? {get set}
    
    func fetchUpcomingMovieListData()
    func fetchPopularMovieData()
}

protocol MovieListPresenterToViewProtocols: class {
    func successUpcomingMovieListFetching(movies: Movies)
    func failUpcomingMovieListFetching()
    
    func successPopularMovieFetching(movies: Movies)
    func failPopularMovieFetching()
}

protocol MovieListPresenterToRouterProtocols: class {
    func showUpcomingMovieListView()
    func showPopularMovieListView()
}


protocol MovieListPresenterToInteractorProtocols: class {
    var MovieListInteractorToPresenterProtocols: MovieListInteractorToPresenterProtocols? { get set }
    
    func fetchUpcomingMovieList()
    func fetchPopularMovie()

}

protocol MovieListInteractorToPresenterProtocols: class {
    func UpcomingMovieListFetchedSuccess(MovieListObj: Movies)
    func UpcomingMovieListFetchedFail()
    
    func PopularMovieFetchedSuccess(MovieObj: Movies)
    func PopularMovieFetchedFail()
}


