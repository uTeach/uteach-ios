//
//  Rating.swift
//  uteach
//
//  Created by Santiago Lazzari on 7/4/16.
//  Copyright © 2016 Santiago Lazzari. All rights reserved.
//

import UIKit

enum RatingType {
    case aPlus
    case a
    case bPlus
    case b
    case cPlus
    case c
    case f
}

class Rating: NSObject {
    
    //MARK - Atributes
    var ratingType: RatingType
    
    //MARK - Init
    init(withRatingType ratingType: RatingType) {
        self.ratingType = ratingType
    }
}
