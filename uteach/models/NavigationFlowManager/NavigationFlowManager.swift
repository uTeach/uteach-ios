//
//  UTNavigationFlowManager.swift
//  uteach
//
//  Created by Santiago Lazzari on 7/2/16.
//  Copyright © 2016 Santiago Lazzari. All rights reserved.
//

import UIKit

class NavigationFlowManager: NSObject {
    
    //MARK: - Atributes
    var window: UIWindow?
    
    static let shareInstance = NavigationFlowManager()
    
    //MARK: - Setup
    func setup() {
        let window = UIWindow(frame: UIScreen.main().bounds)
        
        self.window = window
    }

    func showWindow() {
        window?.makeKeyAndVisible()
    }
    
    //MARK: - Presentations
    func presentSplashControllerAnimated(_ animated: Bool) {
        presentViewController(SplashViewController(), animated: animated)
    }
    
    func presentUserCredentialsControllerAnimated(_ animated: Bool) {
        presentViewController(UserCredentialsViewController(), animated: animated);
    }
    
    func presentHomeControllerAnimated(_ animated: Bool) {
        presentViewController(HomeViewController(), animated: animated)
    }
    
    //MARK: - Utils
    private func presentViewController(_ viewController: UIViewController, animated:Bool) {
        presentViewController(viewController, animated: animated, completion: nil)
    }
    
    private func presentViewController(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        if self.topMostViewController() == nil {
            self.window?.rootViewController = viewController
        } else {
            self.topMostViewController()?.present(viewController, animated: animated, completion: completion)
        }
    }
    
    private func topMostViewController() -> UIViewController? {
        var topViewController = window?.rootViewController
        
        print(topViewController)
        
        while ((topViewController?.presentedViewController) != nil) {
            topViewController = topViewController?.presentedViewController
        }
        
        return topViewController
    }
    
}
