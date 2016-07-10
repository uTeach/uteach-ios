//
//  UserCredentialsViewController.swift
//  uteach
//
//  Created by Santiago Lazzari on 7/5/16.
//  Copyright © 2016 Santiago Lazzari. All rights reserved.
//

import UIKit

class UserCredentialsViewController: BaseViewController, UserCredentialsViewDelegate {
    
    var baseView: UserCredentialsView {
        return view as! UserCredentialsView
    }
    
    //MARK: Navigation
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUserCredentialsView()
        
        tryLogin()
    }
    
    //MARK: - Setup
    func setupUserCredentialsView() {
        baseView.delegate = self
    }

    //MARK: - Login
    private func tryLogin() {
        //TODO: - Simulation of request, must make the actual request
        Timer.scheduledTimer(timeInterval: TimeInterval(5), target: self, selector: #selector(loginDidFail), userInfo: nil, repeats: false)
    }
    
    @objc private func loginDidFail(_ timer: Timer) {
        baseView.showContainerAnimated(animated: true)
    }
    
    //MARK: - UserCredentialsViewDelegate
    func userCredentialsViewDidtapLogin(userCredentialsView: UserCredentialsView) {
        baseView.showLoginAnimated(animated: true)
    }
    
    func userCredentialsViewDidTapSignUp(userCredentialsView: UserCredentialsView) {
        baseView.showSingUpAnimated(animated: true)
    }
    
}
