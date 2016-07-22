//
//  UIColor+ColorPalette.swift
//  uteach
//
//  Created by Santiago Lazzari on 7/5/16.
//  Copyright © 2016 Santiago Lazzari. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func uteachBackground() -> UIColor {
        return uteachGreen()
    }
    
    class func uteachYellow() -> UIColor {
        return UIColor.init(red: 255/255.0, green: 196/255.0, blue: 0/255.0, alpha: 1)
    }
    
    class func uteachViolet() -> UIColor {
        return UIColor.init(red: 255, green: 255/255.0, blue: 0/255.0, alpha: 1)
    }
    
    class func uteachGreen() -> UIColor {
        return UIColor.init(red: 109/255, green: 240/255, blue: 135/255, alpha: 1)
    }
}
