//
//  UTSplashViewController.swift
//  uteach
//
//  Created by Santiago Lazzari on 7/2/16.
//  Copyright © 2016 Santiago Lazzari. All rights reserved.
//

import UIKit

class SplashViewController: BaseViewController {
    @IBOutlet weak var animatingImageView: UIImageView!

    //MARK: - Navigaiton
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAnimatingImageView()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        tryLogin()
    }
    
    //MARK - Setup
    func setupAnimatingImageView() {
        NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(3), target: self, selector: #selector(loginDidFail), userInfo: nil, repeats: false)
    }
    
    //MARK - Login
    func tryLogin() {
    }
    
    func loginDidFail(timer: NSTimer) {
        //Go to login view
        NavigationFlowManager.shareInstance.presentLoginViewController(true)
    }
    
}
