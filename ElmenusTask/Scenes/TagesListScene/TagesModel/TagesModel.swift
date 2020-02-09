//
//  TagesModel.swift
//  ElmenusTask
//
//  Created by Hassan on 2/6/20.
//  Copyright © 2020 Hassan. All rights reserved.
//

import Foundation



struct TagesModel : Codable {
    let tags : [TagModel]?
}


struct TagModel : Codable {
    let tagName  , photoURL : String?
}
