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
        let window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        self.window = window
    }

    func showWindow() {
        window?.makeKeyAndVisible()
    }
    
    //MARK: - Presentations
    func presentSplashAnimated(animated: Bool) {
        presentViewController(SplashViewController(), animated: animated)
    }
    
    func presentLoginViewController(animated: Bool) {
        presentViewController(LoginViewController(), animated: animated);
    }
    
    //MARK: - Utils
    func presentViewController(viewController: UIViewController, animated:Bool) {
        self.presentViewController(viewController, animated: animated, completion: nil)
    }
    
    func presentViewController(viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        if self.topMostViewController() == nil {
            self.window?.rootViewController = viewController
        } else {
            self.topMostViewController()?.presentViewController(viewController, animated: animated, completion: completion)
        }
    }
    
    func topMostViewController() -> UIViewController? {
        var topViewController = window?.rootViewController
        
        while ((topViewController?.presentedViewController) != nil) {
            topViewController = topViewController?.presentedViewController
        }
        
        return topViewController
    }
    
}
