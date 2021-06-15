//
//  MovieListViewController.swift
//  TheMovie
//
//  Created by Macbook Pro on 14/06/2021.
//

import UIKit
import RealmSwift
import SDWebImage
import Reachability

class MovieListViewController: BaseViewController {
    
    @IBOutlet weak var upcomingCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    var movielistViewToPresenter : MovieListViewToPresenterProtocols?
    let upcomingReuseIdentifier = "upcomingcollectionviewcellidentifier"
    let popularReuseIdentifier = "popularCollectionviewcellidentifier"
    let reuseheaderIdentifier = "sectionheaderidentifier"
    let datamanger = DataManger()
    var upcomingmovie = [Movie]()
    var popularmovie = [Movie]()
    var reachability = try! Reachability()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUPVIPER()
        self.reloadMovies()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Offline_Support
        //declare this inside of viewWillAppear
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(note:)), name: .reachabilityChanged, object: reachability)
        do{
            try reachability.startNotifier()
        }catch{
            print("could not start reachability notifier")
        }
    }
    
    func reloadMovies(){
        movielistViewToPresenter?.fetchUpcomingMovieListData()
        movielistViewToPresenter?.fetchPopularMovieData()
        
        upcomingCollectionView.reloadData()
    }
    
    @objc func reachabilityChanged(note: Notification) {
        
        switch reachability.connection {
        case .wifi:
            print("Reachable via WiFi")
        case .cellular:
            print("Reachable via Cellular")
        case .unavailable:
            print("Network not reachable")
            
            self.upcomingmovie = datamanger.getUpcomingfromRealm()
            upcomingCollectionView.reloadData()
            
            self.popularmovie = datamanger.getPopularfromRealm()!
            popularCollectionView.reloadData()
        case .none:
            print("NONE Network")
        }
    }
    
}

extension MovieListViewController{
    func setUPVIPER(){
        let presenter : MovieListViewToPresenterProtocols & MovieListInteractorToPresenterProtocols = MovieListPresenter()
        let router : MovieListPresenterToRouterProtocols = MovieListRouter()
        let interactor : MovieListPresenterToInteractorProtocols = MovieListInteractor()
        self.movielistViewToPresenter = presenter
        presenter.view = self
        presenter.interactor = interactor
        presenter.router = router
        interactor.MovieListInteractorToPresenterProtocols = presenter
        
    }
}


