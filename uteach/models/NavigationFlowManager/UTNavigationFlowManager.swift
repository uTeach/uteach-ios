//
//  UTNavigationFlowManager.swift
//  uteach
//
//  Created by Santiago Lazzari on 7/2/16.
//  Copyright © 2016 Santiago Lazzari. All rights reserved.
//

import UIKit

class UTNavigationFlowManager: NSObject {
    
    //MARK: - Atributes
    
    var window: UIWindow?
    
    //MARK: - Init
    
    init(withWindow window: UIWindow) {
        super.init()
        self.window = window
    }

    static func withDefaultWindow() -> UTNavigationFlowManager {
        let window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let navigationFlowManagerWithDefaultWindow = UTNavigationFlowManager(withWindow: window)
        
        return navigationFlowManagerWithDefaultWindow
    }
    
    func showWindow() {
        window?.makeKeyAndVisible()
    }
    
    //MARK: - Presentations
    
    func presentSplashAnimated(animated: Bool) {
        presentViewController(UTSplashViewController(), animated: true)
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
