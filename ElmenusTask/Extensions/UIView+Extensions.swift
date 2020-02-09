//
//  UIView+Extensions.swift
//  ElmenusTask
//
//  Created by Hassan on 2/5/20.
//  Copyright © 2020 Hassan. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    
    
    func setGradientBackground(colorTop : UIColor , colorBottom : UIColor) {

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop.cgColor, colorBottom.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.bounds

        self.layer.insertSublayer(gradientLayer, at:0)
    }
    
    
}
