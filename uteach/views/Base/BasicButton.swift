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
    let kBasicButtonBorderWidth: CGFloat = 2
    let kBasicButtonAnimationDuration: CGFloat = 0.3
    
    var style:UIColor?
    
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
        layer.borderWidth = kBasicButtonBorderWidth
    }
    
    //MARK - Style
    func fillAnimated(animated: Bool) {
        
    }
    
    func fill() {
        backgroundColor = style
        layer.borderColor = UIColor.clear().cgColor
    }
    
    func clearAnimated(animated: Bool) {
        backgroundColor = UIColor.clear()
        layer.borderColor = style?.cgColor
    }
    
    func clear() {
        
    }
}
