//
//  BaseViewController.swift
//  uteach
//
//  Created by Santiago Lazzari on 7/5/16.
//  Copyright © 2016 Santiago Lazzari. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    //MARK - Navigation
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupBackgroundColor()
    }
    
    //MARK - Setup
    func setupBackgroundColor() {
        self.view.backgroundColor = UIColor.uteachYellowColor()
    }
    
}
