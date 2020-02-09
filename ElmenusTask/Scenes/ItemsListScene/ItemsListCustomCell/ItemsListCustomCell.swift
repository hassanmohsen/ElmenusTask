//
//  ItemsListCustomCell.swift
//  ElmenusTask
//
//  Created by Hassan on 2/7/20.
//  Copyright © 2020 Hassan. All rights reserved.
//

import UIKit
import Hero


class ItemsListCustomCell: UITableViewCell {

    
    static let identifier = String.init(describing: ItemsListCustomCell.self)
    static let nibCell = UINib.init(nibName: ItemsListCustomCell.identifier, bundle: nil)

    
    @IBOutlet weak var lblItemTitle: UILabel!
    @IBOutlet weak var imgItem: UIImageView!
    @IBOutlet weak var bgVi: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(item : ItemModel) -> Void {
        self.lblItemTitle.text = item.name
        self.imgItem.moa.url = item.photoUrl
        
        self.imgItem.hero.id = "ironman"
        
        self.setupCellUIStyle()
        self.setupImageStyle()
        
    }
    private func setupCellUIStyle() -> Void {
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.layer.masksToBounds = true
        bgVi.backgroundColor = AppColors.itemsBGCell
        bgVi.layer.cornerRadius = 8.0
        bgVi.layer.masksToBounds = true
    }
    
    private func setupImageStyle() -> Void {
        self.imgItem.layer.borderColor = UIColor.white.cgColor
        self.imgItem.layer.borderWidth = 5
        self.imgItem.layer.cornerRadius = self.imgItem.frame.width / 2.0
        self.imgItem.layer.masksToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
