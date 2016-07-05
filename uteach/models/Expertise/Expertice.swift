//
//  Expertice.swift
//  uteach
//
//  Created by Santiago Lazzari on 7/4/16.
//  Copyright © 2016 Santiago Lazzari. All rights reserved.
//

import UIKit

enum ExpertiseType {
    case Beginer
    case Averge
    case Advance
    case Expert
}

class Expertice: NSObject {
    
    //MARK - Atributes
    var expertiseType: ExpertiseType
    
    //MARK - Init
    init(withEpertiseType experticeType: ExpertiseType) {
        self.expertiseType = experticeType
    }
}
