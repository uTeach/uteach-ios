//
//  UserCredentialsView.swift
//  uteach
//
//  Created by Santiago Lazzari on 7/6/16.
//  Copyright © 2016 Santiago Lazzari. All rights reserved.
//

import UIKit

class UserCredentialsView: ViewWithXib {

    //MARK - Atributes
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var loginButton: BasicButton!
    @IBOutlet weak var signUpButton: BasicButton!
    var delegate: AnyObject<UserCredentialsViewDelegate>?
    
    let signInView: signInView = SignInView()
    let loginView: LoginView = LoginView()
    
    //MARK - Init
    override func viewWithXibCommonInit() {
        super.viewWithXibCommonInit()
        
        setup()
    }
    
    //MARK - Setup
    func setup() {
        setupLoginButton()
        setupSignUpButton()
        setupContainerView()
        setupLoginView()
        setupSignInView()
    }
    
    func setupLoginButton() {
        loginButton.setTitle("Login", for: .normal)
    }
    
    func setupSignUpButton() {
        signUpButton.setTitle("Sign up", for: .normal)
    }
    
    private func setupContainerView() {
        containerView.isHidden = true
    }
    
    private func setupLoginView() {
        
    }
    
    private func setupSignUpView() {
    
    }
    
    //MARK - Style
    func showContainerAnimated(animated: Bool) {
        containerView.alpha = 0
        containerView.isHidden = false
        
        UIView.animate(withDuration: TimeInterval(0.3)) { 
            self.containerView.alpha = 0.8
        }
    }
    
    func showSingInAnimated(animated: Bool) {
        
    }
    
    func showLoginAnimated(animated: Bool) {
        
    }
    
    //MARK - Action
    @IBAction func loginButtonWasTapped(_ sender: AnyObject) {
        delegate.userCredentialsViewDidTapLogin()
        loginButton.fill(animated: true)
        signUpButton.clear(animated: true)
    }
    
    @IBAction func signUpButtonWasTapped(_ sender: AnyObject) {
        delegate.userCredentialsViewDidTapSignUp()
        signUpButton.fill(animated: true)
        loginButton.clear(animated: true)
    }
    
}
