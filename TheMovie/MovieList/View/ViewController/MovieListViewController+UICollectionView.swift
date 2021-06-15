//
//  MovieListViewController+UICollectionView.swift
//  TheMovie
//
//  Created by Macbook Pro on 15/06/2021.
//

import UIKit

extension MovieListViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == upcomingCollectionView{
            return self.upcomingmovie.count
        }
        if collectionView == popularCollectionView{
            return self.popularmovie.count
        }
        return 0
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == upcomingCollectionView{
            // get a reference to our storyboard cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: upcomingReuseIdentifier, for: indexPath as IndexPath) as! UpcomingCollectionViewCell
            let data = upcomingmovie[indexPath.row]
            let fileUrl = URL(string: Constants.BASE_IMAGE_LINK + data.poster_path!)
            cell.upcomingImgView.sd_setImage(with: fileUrl, placeholderImage: UIImage(named: Constants.PLACEHOLDER_ICON))
            cell.contentView.layer.cornerRadius = 5
            
            return cell
        }
        
        if collectionView == popularCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: popularReuseIdentifier, for: indexPath as IndexPath) as! UpcomingCollectionViewCell
            let data = popularmovie[indexPath.row]
            let fileUrl = URL(string: Constants.BASE_IMAGE_LINK + data.poster_path!)
            cell.upcomingImgView.sd_setImage(with: fileUrl, placeholderImage: UIImage(named: Constants.PLACEHOLDER_ICON))
            cell.contentView.layer.cornerRadius = 5
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == upcomingCollectionView{
            let storyboard: UIStoryboard = UIStoryboard(name: Constants.MOVIE_DETAIL_STORYBOARD, bundle: nil)
            let moviedetailVC: MovieDetiailViewController = storyboard.instantiateViewController(withIdentifier: Constants.MOVIE_DETAIL_IDENTIFIER) as! MovieDetiailViewController
            moviedetailVC.selectedMovieDetail = upcomingmovie[indexPath.item]
            self.present(moviedetailVC, animated: true, completion: nil)
        }
        
        if collectionView == popularCollectionView{
            let storyboard: UIStoryboard = UIStoryboard(name: Constants.MOVIE_DETAIL_STORYBOARD, bundle: nil)
            let moviedetailVC: MovieDetiailViewController = storyboard.instantiateViewController(withIdentifier: Constants.MOVIE_DETAIL_IDENTIFIER) as! MovieDetiailViewController
            moviedetailVC.selectedMovieDetail = popularmovie[indexPath.item]
            self.present(moviedetailVC, animated: true, completion: nil)
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: 100, height: 150)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind:
                            String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let sectionheaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier:
                                                                                    reuseheaderIdentifier, for: indexPath) as! SectionHeader
        if collectionView == upcomingCollectionView{
            sectionheaderView.sectionHeaderlabel?.text = Constants.UPCOMING_TITLE
        }
        else{
            sectionheaderView.sectionHeaderlabel?.text = Constants.POPULAR_TITLE
        }
        return sectionheaderView
    }
}
