//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Kakeru Nakabachi on 2017/05/28.
//  Copyright © 2017年 Kakeru Nakabachi. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {
    //MARK: Initialization
    
   override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    //MARK: Buton Action
    
    func ratingButtonTapped(button: UIButton) {
        print("Button pressed")
    }

    //MARK: Private Methods
    
    private func setupButtons() {
        
        //Create the button
        let button = UIButton()
        button.backgroundColor = UIColor.blue
        
        //Add constraints
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
        
        //Setup the button action
        button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
        
        //Add the button to the stack
        addArrangedSubview(button)
    }
}
