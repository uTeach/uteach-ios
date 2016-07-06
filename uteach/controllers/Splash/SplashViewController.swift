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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tryLogin()
    }
    
    //MARK: - Setup
    func setupAnimatingImageView() {
        let animatingImage = UIImage.animatedImageNamed("splash_animation", duration: 10);
        
        animatingImageView.image = animatingImage
        animatingImageView.startAnimating()
    }
    
    //MARK: - Login
    func tryLogin() {
        //TODO: - Simulation of request, must make the actual request
        Timer.scheduledTimer(timeInterval: TimeInterval(5), target: self, selector: #selector(loginDidFail), userInfo: nil, repeats: false)
    }
    
    func loginDidFail(_ timer: Timer) {
        //Go to login view
        NavigationFlowManager.shareInstance.presentLoginViewController(true)
    }
    
}
