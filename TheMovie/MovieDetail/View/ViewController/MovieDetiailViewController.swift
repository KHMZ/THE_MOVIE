//
//  MovieDetiailViewController.swift
//  TheMovie
//
//  Created by Macbook Pro on 14/06/2021.
//

import UIKit
import SDWebImage

class MovieDetiailViewController: UIViewController {
    var selectedMovieDetail = Movie()
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var backdropImgView: UIImageView!
    @IBOutlet weak var movieImgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var genericLbl: UILabel!
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var favouriteBtn: UIButton!
    @IBOutlet weak var overviewTitleLbl: UILabel!
    @IBOutlet weak var overviewLbl: UILabel!
    var movie = [Movie]()
    let datamanager = DataManger()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setSelectedMovie()
        self.moviewdetailStyle()
//        self.favouriteBtn.setImage(UIImage(named: "UmmarkedForDarkMode"), for: .normal)
      
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showFavouriteButton()
    }
    

    func moviewdetailStyle(){
        self.movieImgView.layer.cornerRadius = 5
        
        self.circleView.layer.cornerRadius = circleView.frame.size.width/2
        self.circleView.clipsToBounds = true
        
        self.circleView.layer.borderColor = UIColor.white.cgColor
        self.circleView.layer.borderWidth = 5.0
    }
    
    func setSelectedMovie(){
        let backdropImgUrl = URL(string: Constants.BASE_IMAGE_LINK + selectedMovieDetail.backdrop_path!)
        self.backdropImgView.sd_setImage(with: backdropImgUrl, placeholderImage: UIImage(named: Constants.PLACEHOLDER_ICON))
        
        let movieImgUrl = URL(string: Constants.BASE_IMAGE_LINK + selectedMovieDetail.poster_path!)
        self.movieImgView.sd_setImage(with: movieImgUrl, placeholderImage: UIImage(named: Constants.PLACEHOLDER_ICON))
        
        self.titleLbl.text = selectedMovieDetail.title
        self.genericLbl.text = Constants.GENERIC
        self.overviewTitleLbl.text = Constants.OVERVIEW
        self.overviewLbl.text = selectedMovieDetail.overview
        
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func favouriteAction(_ sender: Any) {
        datamanager.setFavourite(movie: selectedMovieDetail)
        self.showFavouriteButton()
        
    }
    
    func showFavouriteButton(){
        if selectedMovieDetail.isFavourite == true{
            self.favouriteBtn.setImage(UIImage(named: "Marked"), for: .normal)
        }
        else{
            if traitCollection.userInterfaceStyle == .light {
            self.favouriteBtn.setImage(UIImage(named: "Unmarked"), for: .normal)
            }else{
            self.favouriteBtn.setImage(UIImage(named: "UmmarkedForDarkMode"), for: .normal)
            }
        }
    }
    
}
