//
//  DetailsStackView.swift
//  MovieApp
//
//  Created by endava-bootcamp on 29.03.2023..
//

import Foundation
import UIKit
import PureLayout

class DetailsStackView: UIStackView {
    var nameLabel: UILabel!
    var roleLabel: UILabel!
    
    var name: String?
    var role: String?
    
    init(name: String?, role: String?) {
        super.init(frame: .zero)
        
        self.name = name
        self.role = role
        
        buildViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
        nameLabel = UILabel()
        roleLabel = UILabel()
        
        addArrangedSubview(nameLabel)
        addArrangedSubview(roleLabel)
    }
    
    func styleViews() {
        axis = .vertical
        
        nameLabel.text = name
        roleLabel.text = role
    }
    
    func defineLayoutForViews() {
        
    }
}
