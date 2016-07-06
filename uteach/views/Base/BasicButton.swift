//
//  BasicButton.swift
//  uteach
//
//  Created by Santiago Lazzari on 7/5/16.
//  Copyright © 2016 Santiago Lazzari. All rights reserved.
//

import UIKit

class BasicButton: UIButton {
    
    //MARK - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func commonInit() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.frame.size.height / 2.0
    }
    
    //MARK - Layout
    override func layoutSubviews() {
        self.layer.cornerRadius = self.frame.size.height / 2.0
    }

}
