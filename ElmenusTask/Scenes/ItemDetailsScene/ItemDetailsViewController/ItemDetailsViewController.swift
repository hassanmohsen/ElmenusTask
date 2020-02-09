//
//  ItemDetailsViewController.swift
//  ElmenusTask
//
//  Created by Hassan on 2/9/20.
//  Copyright © 2020 Hassan. All rights reserved.
//

import UIKit
import Hero
class ItemDetailsViewController: UIViewController {

    private var itemDetail : ItemModel!
    
    @IBOutlet weak var viContainer: UIView!
    @IBOutlet weak var imgItem: UIImageView!
    @IBOutlet weak var lblItemTitle: UILabel!
    @IBOutlet weak var txtItemDescription: UITextView!
    @IBOutlet weak var constraintTxtDescriptionHeight: NSLayoutConstraint!
    
    
    
    init(itemDetails : ItemModel) {
        super.init(nibName: String.init(describing: ItemDetailsViewController.self), bundle: nil)
        self.itemDetail = itemDetails
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setItemDetails()
        
        self.view.backgroundColor = AppColors.tagesBGColor
        
        self.setupBackNavigationButton()
        prepareTxtDescriptionStyle()
        imgItem.applyshadowWithCorner(containerView: viContainer,
                                      cornerRadious: imgItem.frame.height / 2.0, shadowColor: AppColors.imageTagesBorder)
    }
    @IBAction func backButAct(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setItemDetails() -> Void {
        imgItem.moa.url = self.itemDetail.photoUrl
        imgItem.hero.id = "ironman"
        
        lblItemTitle.text = itemDetail.name
        txtItemDescription.text = itemDetail.description

    }
    
    
    private func prepareTxtDescriptionStyle() {
        self.txtItemDescription.layer.cornerRadius = 10.0
        self.txtItemDescription.layer.masksToBounds = true
        self.txtItemDescription.backgroundColor = .white
        
        self.txtItemDescription.isScrollEnabled = false
        self.txtItemDescription.sizeToFit()
        self.constraintTxtDescriptionHeight.constant = txtItemDescription.contentSize.height
        
        
    }
    private func setupBackNavigationButton() -> Void {
        let backButton = UIBarButtonItem.init(title: "Back", style: .plain, target: self, action: #selector(backButtonAction))
        self.navigationItem.leftBarButtonItem = backButton
    }
    @objc private func backButtonAction() -> Void {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }

    

}
