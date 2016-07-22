//
//  ViewWithXib.swift
//  uteach
//
//  Created by Santiago Lazzari on 7/6/16.
//  Copyright © 2016 Santiago Lazzari. All rights reserved.
//

import UIKit

class ViewWithXib: UIView {
    
    @IBOutlet weak var view: UIView!
    var isInitialized = false;
    
    //MARK - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewWithXibCommonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        viewWithXibCommonInit()
    }
    
    func viewWithXibCommonInit() {
        if (isInitialized) {
            return;
        }
        
        Bundle(for: self.dynamicType).loadNibNamed(String(self.dynamicType), owner: self, options: nil)
        
        view?.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: frame.size.width, height: frame.size.height))
        
        addSubview(view);
        
        isInitialized = true;
    }
}
