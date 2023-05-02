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

class MovieTableViewCell: UITableViewCell {
    static let identifier = "MovieTableViewCell"


    var imgView: UIImageView!
    var nameLabel: UILabel!
    var descriptionLabel: UILabel!

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
            imgView = UIImageView()
            nameLabel = UILabel()
            descriptionLabel = UILabel()
            
            self.contentView.addSubview(imgView)
            self.contentView.addSubview(nameLabel)
            self.contentView.addSubview(descriptionLabel)

        }

    private func styleViews() {
            nameLabel.font = UIFont(name: "ProximaNova-Bold", size: 16)
            nameLabel.textColor =  UIColor(hex: 0x000000)
            nameLabel.text = "Error"

            descriptionLabel.numberOfLines = 0
            descriptionLabel.font = UIFont(name: "ProximaNova-Regular", size: 14)
            descriptionLabel.textColor = UIColor(hex: 0x828282)

            imgView.clipsToBounds = true
            imgView.contentMode = .scaleAspectFill
            imgView.image = UIImage(systemName: "questionmark")
        
            self.contentView.clipsToBounds = true
            self.contentView.layer.cornerRadius = 10
            self.contentView.backgroundColor = .white
        

        }
    
    func set(movie: MovieModel) {
        let url = movie.imageUrl
        let id = movie.id
        let details = MovieUseCase().getDetails(id: id)
        imgView.loadFrom(URLAddress: url)
        let name = String(movie.name)
        if let year = details?.year {
            let yearString = " (" +  String(year)+")"
            // Use the yearString variable as needed
            nameLabel.text = name + yearString
        }
        print(nameLabel.text!)
        descriptionLabel.text = movie.summary
    }
    
    private func defineLayoutForViews() {
        // Define layout constraints for the imgView
        imgView.autoPinEdge(toSuperviewEdge: .top)
        imgView.autoPinEdge(toSuperviewEdge: .leading)
        imgView.autoPinEdge(toSuperviewEdge: .bottom)
        imgView.autoSetDimension(.width, toSize: 97)
        imgView.autoSetDimension(.height, toSize: 142)

        // Define layout constraints for the nameLabel
        nameLabel.autoPinEdge(.leading, to: .trailing, of: imgView, withOffset: 16)
        nameLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 12)
        nameLabel.autoPinEdge(toSuperviewEdge: .trailing,withInset: 12)

        // Define layout constraints for the descriptionLabel
        descriptionLabel.autoPinEdge(.top, to: .bottom, of: nameLabel, withOffset: 8)
        descriptionLabel.autoPinEdge(.leading, to: .trailing, of: imgView, withOffset: 16)
        descriptionLabel.autoPinEdge(toSuperviewEdge: .trailing,withInset: 12)
        descriptionLabel.autoPinEdge(toSuperviewEdge: .bottom,withInset: 20)
    }

    override func layoutSubviews() {
            let margins = UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8)
            contentView.frame = contentView.frame.inset(by: margins)
            self.layer.cornerRadius = 10
            self.layer.shadowRadius = 10
            self.layer.shadowOpacity = 0.3
    }
}
