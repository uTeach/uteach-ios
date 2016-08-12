//
//  SplashView.swift
//  uteach
//
//  Created by Santiago Lazzari on 7/8/16.
//  Copyright © 2016 Santiago Lazzari. All rights reserved.
//

import UIKit

class SplashView: ControllerView {

    @IBOutlet weak var animatingImageView: UIImageView!
    //MARK: - Init
    override func viewWithXibCommonInit() {
        super.viewWithXibCommonInit()
        
        setupAnimatingImageView()
    }
    
    //MARK: - Setup
    private func setupAnimatingImageView() {
        let animatingImage = UIImage.gifWithName(name: "splash_animation")
        
        animatingImageView.image = animatingImage
        animatingImageView.startAnimating()
    }
    
}
