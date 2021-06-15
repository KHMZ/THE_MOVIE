//
//  MovieListPresenter.swift
//  TheMovie
//
//  Created by Macbook Pro on 14/06/2021.
//

import Foundation

class MovieListPresenter: MovieListViewToPresenterProtocols {
    var view: MovieListPresenterToViewProtocols?
    
    var router: MovieListPresenterToRouterProtocols?
    
    var interactor: MovieListPresenterToInteractorProtocols?
    
    func fetchUpcomingMovieListData() {
        interactor?.fetchUpcomingMovieList()
    }
 
    func fetchPopularMovieData(){
        interactor?.fetchPopularMovie()
    }
    
    
}

extension MovieListPresenter:MovieListInteractorToPresenterProtocols {
    func PopularMovieFetchedSuccess(MovieObj: Movies) {
        view?.successPopularMovieFetching(movies: MovieObj)
    }

    func PopularMovieFetchedFail() {
        view?.failPopularMovieFetching()
    }
    
    func UpcomingMovieListFetchedSuccess(MovieListObj: Movies) {
        view?.successUpcomingMovieListFetching(movies: MovieListObj)
    }
    
    func UpcomingMovieListFetchedFail() {
        view?.failUpcomingMovieListFetching()
    }

}
