//
//  BasicButton.swift
//  uteach
//
//  Created by Santiago Lazzari on 7/5/16.
//  Copyright © 2016 Santiago Lazzari. All rights reserved.
//

import UIKit

class BasicButton: UIButton {
    
    //MARK - Constans
    let kBasicButtonBorderWidth: CGFloat = 1
    let kBasicButtonAnimationDuration: CGFloat = 0.3
    
    //MARK - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        basicButtonCommonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    
        basicButtonCommonInit()
    }
    
    func basicButtonCommonInit() {
        layoutBasicButton()
    }
    
    //MARK - Layout
    override func layoutSubviews() {
        super.layoutSubviews()

        layoutBasicButton()
    }
    
    func layoutBasicButton() {
        layer.masksToBounds = true
        layer.cornerRadius = self.frame.size.height / 2.0
        layer.backgroundColor = backgroundColor?.cgColor
    }
    
    //MARK - Style
    func fill(animated: Bool) {
        UIView.animate(withDuration: TimeInterval(kBasicButtonAnimationDuration)) {
            self.fill()
        }
    }
    
    func style(color: UIColor) {
        backgroundColor = color
    }
    
    func fill() {
        backgroundColor = backgroundColor?.withAlphaComponent(1)
    }
    
    func clear(animated: Bool) {
        UIView.animate(withDuration: TimeInterval(kBasicButtonAnimationDuration)) {
            self.clear()
        }
    }
    
    func clear() {
        backgroundColor = backgroundColor?.withAlphaComponent(0)

    }
}
