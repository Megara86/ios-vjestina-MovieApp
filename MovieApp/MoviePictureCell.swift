//
//  MovieCatergoyCell.swift
//  MovieApp
//
//  Created by endava-bootcamp on 02.05.2023..
//

import Foundation
import UIKit
import PureLayout
import MovieAppData

class MoviePictureCell: UICollectionViewCell {
    static let identifier = "MoviePictureCell"
    
    var navigationController: UINavigationController!    
    var img : UIImage!
    var imgView: UIImageView!
    var likeButton : UIButton!
    var id : Int!

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
        self.autoSetDimensions(to: CGSize(width: self.frame.width, height: self.frame.height))
        print("cell")
        print(self.frame.height)

    }

    private func createViews() {
        img = UIImage()
        imgView = UIImageView()
        contentView.addSubview(imgView)
        
        likeButton = UIButton()
        contentView.addSubview(likeButton)
    }
    
    private func styleViews() {
        imgView.image = img
        imgView.clipsToBounds = true
        imgView.contentMode = .scaleAspectFill
        
        likeButton.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
        likeButton.backgroundColor = UIColor(hex: 0x0B253F).withAlphaComponent(0.6)
        likeButton.layer.cornerRadius = 16
        likeButton.setImage(UIImage(systemName: "heart")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        likeButton.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        likeButton.layer.cornerRadius = likeButton.bounds.size.height/2
        likeButton.autoSetDimensions(to: likeButton.frame.size)
        likeButton.clipsToBounds = true
    }
    private func defineLayoutForViews() {
        
        imgView.autoPinEdge(toSuperviewEdge: .leading, withInset: 0)
        imgView.autoPinEdge(toSuperviewEdge: .trailing, withInset: 0)
        imgView.autoPinEdge(toSuperviewEdge: .top)
        imgView.autoPinEdge(toSuperviewEdge: .bottom)
        imgView.layer.cornerRadius = 10
        
        likeButton.autoPinEdge(.top, to: .top, of: imgView,withOffset: 8)
        likeButton.autoPinEdge(.leading, to: .leading, of: imgView,withOffset: 8)
    }
    
    func set(url: String,id: Int) {
        imgView.loadFrom(URLAddress: url)
        self.id = id
        
    }
    
}

extension MoviePictureCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let movieDetailsViewsController = MovieDetailsViewController(id: id)
        movieDetailsViewsController.tabBarController?.selectedIndex = indexPath.row
        
        self.navigationController.pushViewController(movieDetailsViewsController, animated: true)
    }
}
