//
//  Tages.swift
//  ElmenusTask
//
//  Created by Hassan on 2/8/20.
//  Copyright © 2020 Hassan. All rights reserved.
//

import Foundation
import Moya


enum TagesMoya {
    case tagesList(pageNumber : Int)
}


extension TagesMoya : TargetType {
    var baseURL: URL {
        return URL.init(string: BASE_URL + "tags/")!
    }
    
    var path: String {
        switch self {
        case .tagesList(let pageNumber):
            return "\(pageNumber)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .tagesList:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .tagesList:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    var showIndicator: Bool {
        get {
            switch self {
            case .tagesList(let pageNumber):
                return pageNumber == 0
            }
        }
    }
    
}
extension TargetType {
    var showIndicator: Bool {
        return true
    }
}
