//
//  TagesPresenter.swift
//  ElmenusTask
//
//  Created by Hassan on 2/8/20.
//  Copyright © 2020 Hassan. All rights reserved.
//

import Foundation
import UIKit


protocol TagesPresenterProtocol {
    func getTagesList() -> Void
    func setDelegator(viewController: TagesPresenterResponseProtocol) -> Void
}
protocol TagesPresenterResponseProtocol {
    func successResponse(withTages tages: [TagModel] ) -> Void
    func failureResponse(withError error : Error) -> Void
}



class TagesPresenter: TagesPresenterProtocol {
   
    
    
    private var pageNumber : Int!
    private var apiService : APISManagerProtocol!
    private var delegator : TagesPresenterResponseProtocol?
    private var isFeatchingMore : Bool = false
    
    init(apiService : APISManagerProtocol ) {
        pageNumber = 0
        self.apiService = apiService
        
    }
    
    func setDelegator(viewController: TagesPresenterResponseProtocol) {
        self.delegator = viewController
    }
    func getTagesList() {
        if isFeatchingMore {
            return
        }
        isFeatchingMore  = true
        apiService.sendCustomRequest(model: TagesModel.self,
                                      targetMoya: TagesMoya.tagesList(pageNumber: pageNumber)) { [weak self](result) in
                                        
                                        guard let self = self   else {return}
                                        self.isFeatchingMore = false
                                        
                                        switch result {
                                        case .success(let model ):
                                            print(">>>>>>>> \(model)")
                                            if let tages = model.tags {
                                                self.pageNumber += 1
                                                self.delegator?.successResponse(withTages: tages)

                                            }
                                            
                                        case .failure(let error):
                                            print("error : \(error.localizedDescription)")
                                            self.delegator?.failureResponse(withError: error)
                                        }
                                        
        }
        
        
        
        
        
    }
    
    
    
    
    
}

