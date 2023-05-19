//
//  MovieDetailsViewController.swift
//  MovieApp
//
//  Created by endava-bootcamp on 28.03.2023..
//


import Foundation
import UIKit
import SwiftUI

import PureLayout
import MovieAppData
class MovieDetailsViewController: UIViewController {
    var myImageView: UIImageView!
    var raiting: UILabel!
    var userScoreLabel: UILabel!
    var movieNameLabel: UILabel!
    var movieYearLabel: UILabel!
    var movieDateLabel: UILabel!
    var categorieLabel: UILabel!
    var durationLabel: UILabel!
    var likeButton : UIButton!
    var overviewLabel: UILabel!
    var summaryText : UILabel!
    var topFirst: UILabel!
    var topSecond: UILabel!
    var topThird: UILabel!
    var bottomFirst: UILabel!
    var bottomSecond: UILabel!
    var bottomThird: UILabel!
    var verticalStackView: UIStackView!
    var horizontalStackView1: UIStackView!
    var horizontalStackView2: UIStackView!
    var id: Int!

    
    init(id: Int) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationItem.leftBarButtonItem =  UIBarButtonItem(title: "Movie List",style: .done, target: self, action:
                                                                #selector(handleNextButton))
        navigationItem.leftBarButtonItem?.tintColor = UIColor(hex: 0x007AFF)
        let titleItem = UILabel()
        titleItem.text = "Movie details"
  

        navigationItem.titleView = titleItem
        buildViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        UIView.animate(withDuration: 0.2, animations: {
            self.raiting.transform = .identity
            self.userScoreLabel.transform = .identity
            self.movieNameLabel.transform = .identity
            self.movieYearLabel.transform = .identity
            self.movieDateLabel.transform = .identity
            self.movieNameLabel.transform = .identity
            self.categorieLabel.transform = .identity
            self.durationLabel.transform = .identity
            self.summaryText.transform = .identity

        })
        
        UIView.animate(withDuration: 0.3,delay: 0.2, animations: {
            self.verticalStackView.alpha = 1

        })
        

    }
    
    @objc func handleNextButton() {
        navigationController?.popViewController(animated: true)
    }
    
    private func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    private func createViews() {
        myImageView = UIImageView()
        view.addSubview(myImageView)
        
        raiting = UILabel()
        view.addSubview(raiting)
        
        userScoreLabel = UILabel()
        view.addSubview(userScoreLabel)
        
        movieNameLabel = UILabel()
        view.addSubview(movieNameLabel)
        
        movieYearLabel = UILabel()
        view.addSubview(movieYearLabel)
        
        movieDateLabel = UILabel()
        view.addSubview(movieDateLabel)
        
        categorieLabel = UILabel()
        view.addSubview(categorieLabel)
        
        durationLabel = UILabel()
        view.addSubview(durationLabel)
        
        overviewLabel = UILabel()
        view.addSubview(overviewLabel)
        
        likeButton = UIButton(type: .custom)
        view.addSubview(likeButton)
        
        summaryText = UILabel()
        view.addSubview(summaryText)
        
        verticalStackView = UIStackView()
        view.addSubview(verticalStackView)
        
        horizontalStackView1 = UIStackView()
        view.addSubview(horizontalStackView1)
        
        horizontalStackView2 = UIStackView()
        view.addSubview(horizontalStackView2)
        
        topFirst = UILabel()
        view.addSubview(topFirst)
        
        topSecond = UILabel()
        view.addSubview(topSecond)
        
        topThird = UILabel()
        view.addSubview(topThird)
        
        bottomFirst = UILabel()
        view.addSubview(bottomFirst)
        
        bottomSecond = UILabel()
        view.addSubview(bottomSecond)
        
        bottomThird = UILabel()
        view.addSubview(bottomThird)
    }
    
    private func styleViews() {
        // Do any additional setup after loading the view.
        if let details = MovieUseCase().getDetails(id: id){
            let url = details.imageUrl
            
            raiting.text = String(details.rating)
    
            movieNameLabel.text = String(details.name)
            movieYearLabel.text = " (" +  String(details.year)+")"
            summaryText.text = details.summary
            durationLabel.text = String(details.duration/60) + "h " + String(details.duration%60) + "m"
            
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "yyyy-MM-dd"
            let showDate = outputFormatter.date(from:details.releaseDate)
            outputFormatter.dateFormat = "dd/MM/yyy"
            let resultString = outputFormatter.string(from:showDate!)
            var categories = details.categories
            movieDateLabel.text = resultString + " (US)"
            var text = ""

            for category in categories{
                if(text == ""){
                    text = String(describing: category)

                }else{
                    text = text + ", " + String(describing: category)
                }
            }
            
            categorieLabel.text = text

            myImageView.loadFrom(URLAddress: url)
            let members : [MovieCrewMemberModel] = details.crewMembers
            
            let attributesBold = [
                        NSAttributedString.Key.font:  UIFont(name: "ProximaNova-Bold", size: 14)!
                    ]
            let attributesRegular = [
                        NSAttributedString.Key.font:  UIFont(name: "ProximaNova-Regular", size: 14)!
                    ]
            
            var textString = NSMutableAttributedString()

            var memberName = NSAttributedString(string: members[0].name + "\n" , attributes: attributesBold)
            var memberRole = NSAttributedString(string: members[0].role  , attributes: attributesRegular)
            textString.append(memberName)
            textString.append(memberRole)
            topFirst.attributedText = textString
            topFirst.numberOfLines = 0
            horizontalStackView1.addArrangedSubview(topFirst)
            
            textString = NSMutableAttributedString()
            memberName = NSAttributedString(string: members[1].name + "\n" , attributes: attributesBold)
            memberRole = NSAttributedString(string: members[1].role  , attributes: attributesRegular)
            textString.append(memberName)
            textString.append(memberRole)
            topSecond.attributedText = textString
            topSecond.numberOfLines = 0
            horizontalStackView1.addArrangedSubview(topSecond)
            
            textString = NSMutableAttributedString()
            memberName = NSAttributedString(string: members[2].name + "\n" , attributes: attributesBold)
            memberRole = NSAttributedString(string: members[2].role , attributes: attributesRegular)
            textString.append(memberName)
            textString.append(memberRole)
            topThird.attributedText = textString
            topThird.numberOfLines = 0
            horizontalStackView1.addArrangedSubview(topThird)
            
            textString = NSMutableAttributedString()
            memberName = NSAttributedString(string: members[3].name + "\n" , attributes: attributesBold)
            memberRole = NSAttributedString(string: members[3].role  , attributes: attributesRegular)
            textString.append(memberName)
            textString.append(memberRole)
            bottomFirst.attributedText = textString
            bottomFirst.numberOfLines = 0
            horizontalStackView2.addArrangedSubview(bottomFirst)
            
            textString = NSMutableAttributedString()
            memberName = NSAttributedString(string: members[4].name + "\n" , attributes: attributesBold)
            memberRole = NSAttributedString(string: members[4].role  , attributes: attributesRegular)
            textString.append(memberName)
            textString.append(memberRole)
            bottomSecond.attributedText = textString
            bottomSecond.numberOfLines = 0
            horizontalStackView2.addArrangedSubview(bottomSecond)
            
            horizontalStackView2.addArrangedSubview(bottomThird)
            
            verticalStackView.addArrangedSubview(horizontalStackView1)
            verticalStackView.addArrangedSubview(horizontalStackView2)
         
        }else{
            print("Details not found or URL is nil")
        }
        
        myImageView.contentMode = .scaleAspectFill
        myImageView.clipsToBounds = true
        
        raiting.textColor = .white
        raiting.font = UIFont(name: "ProximaNova-Bold", size: 16)
        raiting.transform = raiting.transform.translatedBy(x: view.frame.width * 2, y: -view.frame.height)

        
        userScoreLabel.text = "User score"
        userScoreLabel.textColor = .white
        userScoreLabel.font = UIFont(name: "ProximaNova-Regular", size: 14)
        userScoreLabel.transform = userScoreLabel.transform.translatedBy(x: -view.frame.width, y:0)

        
        movieNameLabel.textColor = .white
        movieNameLabel.font = UIFont(name: "ProximaNova-Bold", size: 20)
        movieYearLabel.textColor = .white
        movieYearLabel.font = UIFont(name: "ProximaNova-Regular", size: 20)
        movieNameLabel.transform = movieNameLabel.transform.translatedBy(x: -view.frame.width, y:0)
        movieYearLabel.transform = movieYearLabel.transform.translatedBy(x: -view.frame.width, y:0)


        movieDateLabel.textColor = .white
        movieDateLabel.font = UIFont(name: "ProximaNova-Regular", size: 14)
        movieDateLabel.transform = movieDateLabel.transform.translatedBy(x: -view.frame.width, y:0)

        categorieLabel.textColor = .white
        categorieLabel.font = UIFont(name: "ProximaNova-Regular", size: 14)
        categorieLabel.transform = categorieLabel.transform.translatedBy(x: -view.frame.width, y:0)

        durationLabel.textColor = .white
        durationLabel.font = UIFont(name: "ProximaNova-Bold", size: 14)
        durationLabel.transform = durationLabel.transform.translatedBy(x: -view.frame.width, y:0)

        
        likeButton.backgroundColor =  UIColor(hex: 0x757575)
        likeButton.frame.size = CGSize(width: 32.0, height: 32)
        likeButton.setImage(UIImage(named: "Vector.png"), for: .normal)
        likeButton.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        likeButton.layer.cornerRadius = likeButton.bounds.size.height/2
        likeButton.autoSetDimensions(to: likeButton.frame.size)
        likeButton.clipsToBounds = true

        overviewLabel.textColor = .black
        overviewLabel.text = "Overview"
        overviewLabel.font = UIFont(name: "ProximaNova-Bold", size: 20)
        
        summaryText.textColor = .black
        summaryText.font = UIFont(name: "ProximaNova-Regular", size: 14)
        summaryText.numberOfLines = 0
        summaryText.transform = summaryText.transform.translatedBy(x: -view.frame.width, y:0)

        verticalStackView.axis = .vertical
        verticalStackView.alignment = .fill
        verticalStackView.distribution = .fillEqually
        verticalStackView.spacing = 24
        verticalStackView.alpha = 0
                
        horizontalStackView1.axis = .horizontal
        horizontalStackView1.alignment = .fill
        horizontalStackView1.distribution = .fillEqually
        horizontalStackView1.spacing = 16
                
        horizontalStackView2.axis = .horizontal
        horizontalStackView2.alignment = .fill
        horizontalStackView2.distribution = .fillEqually
        horizontalStackView2.spacing = 16
    }
    
    private func defineLayoutForViews() {
        myImageView.autoPinEdge(toSuperviewSafeArea: .top)
        myImageView.autoPinEdge(toSuperviewSafeArea: .leading)
        myImageView.autoPinEdge(toSuperviewSafeArea: .trailing)
        myImageView.autoSetDimension(.height, toSize:300)

        raiting.autoPinEdge(toSuperviewSafeArea: .leading,withInset: 20)
        raiting.autoPinEdge(toSuperviewSafeArea: .top, withInset: 135)
        
        userScoreLabel.autoPinEdge(.leading, to: .trailing, of: raiting, withOffset: 8)
        userScoreLabel.autoPinEdge(toSuperviewSafeArea: .top, withInset: 136)
        
        movieNameLabel.autoPinEdge(.top, to: .bottom, of: raiting, withOffset: 16)
        movieNameLabel.autoPinEdge(toSuperviewSafeArea: .leading,withInset: 20)
        
        movieYearLabel.autoPinEdge(.top, to: .bottom, of: raiting, withOffset: 16)
        movieYearLabel.autoPinEdge(.leading, to:.trailing, of: movieNameLabel, withOffset: 1)
        
        movieDateLabel.autoPinEdge(toSuperviewSafeArea: .leading,withInset: 20)
        movieDateLabel.autoPinEdge(.top, to: .bottom, of: movieNameLabel, withOffset: 16)
        
        categorieLabel.autoPinEdge(toSuperviewSafeArea: .leading,withInset: 20)
        categorieLabel.autoPinEdge(.top, to: .bottom, of: movieDateLabel)
        
        durationLabel.autoPinEdge(.leading, to:.trailing, of: categorieLabel, withOffset: 5)
        durationLabel.autoPinEdge(.top, to: .bottom, of: movieDateLabel)
        
        likeButton.autoAlignAxis(.vertical, toSameAxisOf: raiting)
        likeButton.autoPinEdge(.top, to: .bottom, of: categorieLabel,withOffset: 16)
        
        overviewLabel.autoPinEdge(toSuperviewSafeArea: .leading,withInset: 20)
        overviewLabel.autoPinEdge(.top, to: .bottom, of: myImageView,withOffset: 22)
        
        summaryText.autoPinEdge(toSuperviewSafeArea: .leading,withInset: 10)
        summaryText.autoPinEdge(.top, to: .bottom, of: overviewLabel,withOffset: 8)
        summaryText.autoPinEdge(toSuperviewSafeArea: .trailing,withInset: 10)
//        summaryText.autoPinEdge(toSuperviewEdge: .bottom,withInset: 392)
        
        verticalStackView.autoPinEdge(.top, to: .bottom, of: summaryText, withOffset: 22)
        verticalStackView.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 16)
        verticalStackView.autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 16)
    }
}
