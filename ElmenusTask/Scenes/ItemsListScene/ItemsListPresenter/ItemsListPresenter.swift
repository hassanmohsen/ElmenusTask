//
//  ItemsListPresenter.swift
//  ElmenusTask
//
//  Created by Hassan on 2/8/20.
//  Copyright © 2020 Hassan. All rights reserved.
//

import Foundation

protocol ItemsListPresenterProtocol {
    func getItemsList() -> Void
    func setDelegator(delegator: ItemsListResponceProtocol) -> Void

}

protocol ItemsListResponceProtocol {
    func successResponse(withItems items: [ItemModel] ) -> Void
    func failureResponse(withError error : Error) -> Void
}




class ItemsListPresenter: ItemsListPresenterProtocol  {
    
    
    private var delegator : ItemsListResponceProtocol?
    private var tageName : String!
    private var apiService : APISManagerProtocol!
    
    init(apiService : APISManagerProtocol , withTag name : String ) {
        self.tageName = name
        self.apiService = apiService
    }
    
    
    func setDelegator(delegator: ItemsListResponceProtocol) {
        self.delegator = delegator
    }
    
    func getItemsList() {
        apiService.sendCustomRequest(model: ItemsListModel.self,
                                     targetMoya: ItemsMoya.itemsList(tageName: self.tageName)) { [weak self] (result) in
                                        
                                        guard let self = self else {return}
                                        switch result {
                                            
                                        case .success(let model):
                                            if let items = model.items {
                                                self.delegator?.successResponse(withItems: items)
                                            }
                                        case .failure(let error):
                                            self.delegator?.failureResponse(withError: error)
                                        }
                                        
                                        
        }
    }
    
}
