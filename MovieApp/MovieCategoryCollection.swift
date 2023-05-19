//
//  MovieTableViewCell.swift
//  MovieApp
//
//  Created by endava-bootcamp on 27.04.2023..
//

import Foundation
import UIKit
import PureLayout
import MovieAppData

protocol MovieCategoryCollectionDelegate {
    func delegateFunction(id: Int)
}

class MovieCategoryCollection:UITableViewCell{
    static let identifier = "MovieCategoryCollection"
    
    var delegate: MovieCategoryCollectionDelegate?
    var collectionView: UICollectionView!
    var nameLabel: UILabel!
    var movies = [MovieModel]()
    var imgView: UIImageView!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        buildViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildViews() {
            createViews()
            styleViews()
            defineLayoutForViews()

        }
    
    private func createViews() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 8
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0)

        collectionView = UICollectionView(
            frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height),
            collectionViewLayout: flowLayout
        )
        nameLabel = UILabel()
        imgView = UIImageView()
        
        contentView.addSubview(collectionView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(imgView)
        }

    private func styleViews() {
        collectionView.register(MoviePictureCell.self, forCellWithReuseIdentifier: MoviePictureCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    
        
        nameLabel.font = UIFont(name: "ProximaNova-Bold", size: 20)
        nameLabel.textColor =  UIColor(hex: 0x0B253F)
        nameLabel.text = "Error"

        imgView.clipsToBounds = true
        imgView.contentMode = .scaleAspectFill
        imgView.image = UIImage(systemName: "questionmark")
    }
    
    func setCategory(movies: [MovieModel], name: String ) {
        nameLabel.text = name
        self.movies = movies

    }
    
    private func defineLayoutForViews() {
        nameLabel.autoPinEdge(toSuperviewEdge: .top)
        nameLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)
        
        collectionView.autoPinEdge(.top, to: .bottom, of:nameLabel,withOffset: 16)
        collectionView.autoPinEdge(toSuperviewEdge: .trailing)
        collectionView.autoPinEdge(toSuperviewEdge: .bottom,withInset: 40)
        collectionView.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)
        collectionView.autoSetDimension(.height, toSize: 180)

    }
}
extension MovieCategoryCollection: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoviePictureCell.identifier ,for:
                indexPath) as? MoviePictureCell else {
                fatalError("Table view cannot dequeue a customcell")
            }
        cell.set(url: movies[indexPath.row].imageUrl ,id: movies[indexPath.row].id)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 125, height: 180)
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.delegateFunction(id: movies[indexPath.row].id )
    }
}
