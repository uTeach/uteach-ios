//
//  SplashToUserCredentialsTransition.swift
//  uteach
//
//  Created by Santiago Lazzari on 7/7/16.
//  Copyright © 2016 Santiago Lazzari. All rights reserved.
//

import UIKit

class SplashToUserCredentialsTransition: NSObject, UIViewControllerAnimatedTransitioning  {

    let kToViewControllerViewFadePadding: CGFloat = 30
    
    //MARK - UIViewControllerAnimatedTransitioning
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewController(forKey: UITransitionContextFromViewControllerKey)
        let toViewController = transitionContext.viewController(forKey: UITransitionContextToViewControllerKey)

        
        let toView = toViewController?.view
        let fromView = fromViewController?.view

        print("toView type", toView?.dynamicType, "fromView type", fromView?.dynamicType)
        
        let transitionContextView = transitionContext.containerView()
        toViewController?.view.alpha = 0;
        
        layoutView(view: (toView)!, withPadding: kToViewControllerViewFadePadding, width: (fromView?.frame.size.width)!, height: (fromView?.frame.size.height)!)
        
        toView?.layoutIfNeeded()
        
        
        transitionContextView.addSubview((fromView)!);
        transitionContextView.addSubview((toView)!)
        
        layoutView(view: (toView)!, withPadding: 0, width: (fromView?.frame.size.width)!, height: (fromView?.frame.size.height)!)
        
        print("x :", toView?.frame.origin.x, "y :", toView?.frame.origin.y, "width :", toView?.frame.width, "height :", toView?.frame.size.height)
        
        
        UIView.animate(withDuration: 1, animations: {
            toView?.alpha = 0.8
            
            self.layoutView(view: (toView)!, withPadding: 0, width: (fromView?.frame.size.width)!, height: (fromView?.frame.size.height)!)
            
            print("x :", toView?.frame.origin.x, "y :", toView?.frame.origin.y, "width :", toView?.frame.width, "height :", toView?.frame.size.height)
            
            
            
            toView?.layoutIfNeeded()
            
            }) { (finish) in
                fromViewController?.view = nil
                
                toViewController?.view = fromView!
//                toViewController?.view.addSubview(toView!)
                
//                toViewController?.
                
                transitionContext.completeTransition(true)
                print("toView type", toView?.dynamicType, "fromView type", fromView?.dynamicType)
        }
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return TimeInterval(1)
    }
    
    func layoutView(view: UIView, withPadding padding: CGFloat, width: CGFloat, height: CGFloat) {
        let viewX = padding
        let viewY = padding
        let viewWidth = width - 2 * padding
        let viewHeight = height - 2 * padding
        
        view.frame = CGRect(origin: CGPoint(x: viewX, y: viewY), size: CGSize(width: viewWidth, height: viewHeight))
    }
    
    
    
}
