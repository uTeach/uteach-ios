//
//  UTSplashViewController.swift
//  uteach
//
//  Created by Santiago Lazzari on 7/2/16.
//  Copyright © 2016 Santiago Lazzari. All rights reserved.
//

import UIKit

class UTSplashViewController: BaseViewController {

    //MARK: - Navigaiton
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupBackgroundColor()
    }
    
    //MARK - Setup
    func setupBackgroundColor() {
        self.view.backgroundColor = UIColor.uteachYellowColor();
    }
    
}
