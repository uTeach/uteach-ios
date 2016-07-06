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
    
    @IBOutlet weak var loginButton: BasicButton!
    @IBOutlet weak var signUpButton: BasicButton!
    //MARK - Init
    override func viewWithXibCommonInit() {
        super.viewWithXibCommonInit()
        
        setup()
    }
    
    //MARK - Setup
    func setup() {
        setupLoginButton()
        setupSignUpButton()
    }
    
    func setupLoginButton() {
        loginButton.setTitle("Login", for: .normal)
    }
    
    func setupSignUpButton() {
        signUpButton.setTitle("Sign up", for: .normal)
    }
    
    //MARK - Style
    func showSingInAnimated(animated:Bool) {
        
    }
    
    func showLoginAnimated(animated:Bool) {
        
    }
    
    //MARK - Action
    @IBAction func loginButtonWasTapped(_ sender: AnyObject) {
        print("Login button was tapped")
        setupLoginButton()
    }
    
    @IBAction func signUpButtonWasTapped(_ sender: AnyObject) {
        print("sign up button was tapped")
    }
    
    
}
