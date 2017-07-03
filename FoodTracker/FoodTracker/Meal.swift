//
//  Meal.swift
//  FoodTracker
//
//  Created by Kakeru Nakabachi on 2017/06/14.
//  Copyright © 2017年 Kakeru Nakabachi. All rights reserved.
//

import UIKit

class Meal {
    
    //MARK: Propaties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    //MARK: Initialization
    init(name: String, photo: UIImage?, rating: Int) {
        self.name = name
        self.photo = photo
        self.rating = rating
    }
}
