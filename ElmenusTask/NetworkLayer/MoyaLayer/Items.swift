//
//  Items.swift
//  ElmenusTask
//
//  Created by Hassan on 2/8/20.
//  Copyright © 2020 Hassan. All rights reserved.
//

import Foundation
import Moya


enum ItemsMoya {
    case itemsList(tageName : String)
}


extension ItemsMoya : TargetType {
    var baseURL: URL {
        return URL.init(string: BASE_URL + "items/")!
    }
    
    var path: String {
        switch self {
        case .itemsList(let tageName):
            return tageName
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .itemsList:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .itemsList:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    var showIndicator: Bool {
        return true
    }
    
}

