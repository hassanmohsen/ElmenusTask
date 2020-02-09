//
//  TagesListCell.swift
//  ElmenusTask
//
//  Created by Hassan on 2/7/20.
//  Copyright © 2020 Hassan. All rights reserved.
//

import Foundation
import UIKit


class TagesListCell : CarLensCollectionViewCell {
    
    static let identifier = String.init(describing: TagesListCell.self)

  
    private var upperView : UIView = {
        let vi = UIView()
        vi.translatesAutoresizingMaskIntoConstraints = false
        vi.backgroundColor = .clear

        return vi
    }()
    private var bottomView: UIView = {
        let vi = UIView()
        vi.translatesAutoresizingMaskIntoConstraints = false
        vi.backgroundColor = .clear
        vi.layer.cornerRadius = 10.0
        vi.layer.masksToBounds = true
        return vi
    }()
    
    private var lblTitle : UILabel!
    private var imgTage : UIImageView!
    private var viImageParent : UIView!
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        bottomView.addSubview(prepareTageTitle(frame: frame))
        let contanerView = prepareImageParentView(frame: frame)
        contanerView.addSubview(prepareTageImage(frame: contanerView.frame))
        bottomView.addSubview(contanerView)
        configure(topView: upperView, cardView: bottomView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func prepareTageTitle(frame : CGRect) -> UILabel {
        lblTitle = UILabel.init(frame: CGRect(x: 10, y: 10, width: frame.width - 20, height: 40))
        lblTitle.textAlignment = .center
        lblTitle.font = UIFont.systemFont(ofSize: 18)
        lblTitle.textColor = .black
        return lblTitle
    }
    
    
    private func prepareTageImage(frame : CGRect) -> UIImageView {
        
        imgTage = UIImageView.init(frame: CGRect.init(x: 5,
                                                      y: 5,
                                                      width: frame.width - 5,
                                                      height: frame.width - 5))
        
        imgTage.applyshadowWithCorner(containerView: viImageParent, cornerRadious: imgTage.frame.width / 2.0, shadowColor: AppColors.imageTagesBorder)

        return imgTage
    }
    private func prepareImageParentView(frame : CGRect) -> UIView {
        viImageParent = UIView.init(frame: CGRect(x: 15,
                                                  y: lblTitle.frame.height + (3 * lblTitle.frame.origin.y),
                                                  width: frame.width - 45,
                                                  height: frame.width - 45))
        
        return viImageParent
    }

    
    func configureCell(tagModel : TagModel) -> Void {
        lblTitle.text = tagModel.tagName
        imgTage.moa.url = tagModel.photoURL
//        lblTitle.text = "dsfsdfsdfsd"
    }
    
    
    
    
    
}
