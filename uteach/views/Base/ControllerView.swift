//
//  ControllerView.swift
//  uteach
//
//  Created by Santiago Lazzari on 7/12/16.
//  Copyright © 2016 Santiago Lazzari. All rights reserved.
//

import UIKit

class ControllerView: ViewWithXib {

    //MARK: - Init
    override func viewWithXibCommonInit() {
        super.viewWithXibCommonInit()
        
//        setupBackgroundColor()
    }
    

    func setupBackgroundColor() {
        view.backgroundColor = UIColor.uteachGreen()
        
        print(UIColor.uteachGreen())
    }

}
