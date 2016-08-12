//
//  ModalNotification.swift
//  uteach
//
//  Created by Santiago Lazzari on 7/22/16.
//  Copyright © 2016 Santiago Lazzari. All rights reserved.
//

import UIKit

class ModalNotification: NSObject {

    static let window = UIApplication.shared().windows.last
    
    static var notificationView, modalView: UIView?
    
    //MARK: - Init
    
    /**
     * Pop modal notification with a specific view to pop as notification, this one has 
     * no modal like view then you cant tap and slide to get the modal view
    **/
    static func popModalNotification(withNotificationView notificationView: UIView) {
        popModalNotification(withNotificationView: notificationView, modalView: nil)
    }
    
    static func popModalNotification(withNotificationView notificationView: UIView, modalView: UIView?) {
        self.notificationView = notificationView
        self.modalView = modalView
        
        setupNotificationView()
        
        popNotificationView()
    }
    
    //MARK: - Setup
    static func setupNotificationView() {
        let notificationViewGestureRecognizer = UILongPressGestureRecognizer(target: self, action: "notificationViewWasLongTapped")
        
        notificationView?.addGestureRecognizer(notificationViewGestureRecognizer)
    }
    
    //MARK: - Presentation
    static func popNotificationView() {
        let modalNotificationView = ModalNotificationView()
        
        modalNotificationView.frame = CGRect(origin: CGPoint(x: -100, y: 0), size: CGSize(width: 100, height: 100))
    
        window?.addSubview(modalNotificationView)
        
        UIView.animate(withDuration: 0.3) { 
            modalNotificationView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 100, height: 100))
        }
    }
    
    func notificationViewWasLongTapped(sender: UILongPressGestureRecognizer) {
        print("entre guachin")
    }
    
    //MARK: - TopController
    private static func topMostViewController() -> UIViewController? {
        var topViewController = window?.rootViewController
        
        while ((topViewController?.presentedViewController) != nil) {
            topViewController = topViewController?.presentedViewController
        }
        
        print(topViewController)
        
        return topViewController
    }
}
