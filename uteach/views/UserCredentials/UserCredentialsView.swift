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
    var delegate: UserCredentialsViewDelegate?
    
    let signUpView: SignUpView = SignUpView()
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
        setupSignUpView()
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
        loginView.alpha = 0
        loginView.isHidden = true
    }
    
    private func setupSignUpView() {
        signUpView.alpha = 0
        signUpView.isHidden = true
    }
    
    //MARK - Style
    func showContainerAnimated(animated: Bool) {
        containerView.alpha = 0
        containerView.isHidden = false
        
        UIView.animate(withDuration: TimeInterval(0.3)) { 
            self.containerView.alpha = 0.8
        }
    }
    
    func showLoginAnimated(animated: Bool) {

        loginButton.fill(animated: true)
        signUpButton.clear(animated: true)

        loginView.isHidden = false
        addSubview(loginView)
        loginView.frame = (loginButton.superview?.convert(loginButton.frame, to: view))!
        loginView.alpha = 0
        
        UIView.animate(withDuration: TimeInterval(0.5), delay: TimeInterval(0), usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: UIViewAnimationOptions(rawValue: UInt(0)), animations: {
            self.loginView.alpha = 1
            self.loginView.frame = CGRect(origin: CGPoint(x: 20, y: 20), size: CGSize(width: self.frame.size.width - 40, height: 200))
            
            
            }) { (finish) in
            
        }
    }
    
    func showSingUpAnimated(animated: Bool) {
        signUpButton.fill(animated: true)
        loginButton.clear(animated: true)
    }
    
    
    //MARK - Action
    @IBAction func loginButtonWasTapped(_ sender: AnyObject) {
        delegate?.userCredentialsViewDidtapLogin(userCredentialsView: self)
    }
    
    @IBAction func signUpButtonWasTapped(_ sender: AnyObject) {
        delegate?.userCredentialsViewDidTapSignUp(userCredentialsView: self)
    }
}
