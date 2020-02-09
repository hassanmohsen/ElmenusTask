//
//  ItemsListModel.swift
//  ElmenusTask
//
//  Created by Hassan on 2/7/20.
//  Copyright © 2020 Hassan. All rights reserved.
//

import Foundation


struct ItemsListModel : Codable{
    let items : [ItemModel]?
}

struct ItemModel : Codable {
    let id : Int?
    let name : String?
    let photoUrl : String?
    let description : String?
}

