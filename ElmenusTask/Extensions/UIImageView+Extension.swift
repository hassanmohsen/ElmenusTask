//
//  UIImageView+Extension.swift
//  ElmenusTask
//
//  Created by Hassan on 2/9/20.
//  Copyright © 2020 Hassan. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func applyshadowWithCorner(containerView : UIView, cornerRadious : CGFloat , shadowColor : UIColor){
        containerView.clipsToBounds = false
        containerView.layer.shadowColor = shadowColor.cgColor
        containerView.layer.shadowOpacity = 1
        containerView.layer.shadowOffset = CGSize.zero
        containerView.layer.shadowRadius = 10
        containerView.layer.cornerRadius = cornerRadious
        containerView.layer.shadowPath = UIBezierPath(roundedRect: containerView.bounds, cornerRadius: cornerRadious).cgPath
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadious
    }
}
