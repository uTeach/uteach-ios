//
//  Expertice.swift
//  uteach
//
//  Created by Santiago Lazzari on 7/4/16.
//  Copyright © 2016 Santiago Lazzari. All rights reserved.
//

import UIKit

enum ExpertiseType {
    case beginer
    case averge
    case advance
    case expert
}

class Expertice: NSObject {
    
    //MARK - Atributes
    var expertiseType: ExpertiseType
    
    //MARK - Init
    init(withEpertiseType experticeType: ExpertiseType) {
        self.expertiseType = experticeType
    }
}
