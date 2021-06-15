//
//  MovieListViewController+ViewControlling.swift
//  TheMovie
//
//  Created by Macbook Pro on 15/06/2021.
//

import UIKit

extension MovieListViewController: MovieListPresenterToViewProtocols{
    
    func successPopularMovieFetching(movies: Movies) {
        datamanger.savePopularMovies(movies: movies)
        self.popularmovie = datamanger.getPopularfromRealm()!
        popularCollectionView.reloadData()
    }
    
    func failPopularMovieFetching() {
        showAlert(Constants.NETWORKERROR, message: Constants.CANNOTCONNECT_TOSERVER, titleAction: Constants.OK, ViewController: self, ok: {
        })
    }
    
    func successUpcomingMovieListFetching(movies: Movies) {
        datamanger.saveUpcomingMovies(movies: movies)
        self.upcomingmovie = datamanger.getUpcomingfromRealm()
        upcomingCollectionView.reloadData()
    }
    
    func failUpcomingMovieListFetching() {
        showAlert(Constants.NETWORKERROR, message: Constants.CANNOTCONNECT_TOSERVER, titleAction: Constants.OK, ViewController: self, ok: {
        })
    }
    
    
}
