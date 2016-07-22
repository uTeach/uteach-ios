//
//  SplashViewController.swift
//  uteach
//
//  Created by Santiago Lazzari on 7/12/16.
//  Copyright © 2016 Santiago Lazzari. All rights reserved.
//

import UIKit

class SplashViewController: BaseViewController {
    //MARK: - Navigation
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tryLogin()
    }
    
    //MARK: - Login
    private func tryLogin() {
        //TODO: - Simulation of request, must make the actual request
        Timer.scheduledTimer(timeInterval: TimeInterval(5), target: self, selector: #selector(loginDidFail), userInfo: nil, repeats: false)
    }
    
    @objc private func loginDidFail(_ timer: Timer) {
        NavigationFlowManager.shareInstance.presentHomeControllerAnimated(true)
    }
}
