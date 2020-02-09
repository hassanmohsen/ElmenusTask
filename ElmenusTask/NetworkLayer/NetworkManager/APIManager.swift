//
//  APIManager.swift
//  ElmenusTask
//
//  Created by Hassan on 2/8/20.
//  Copyright © 2020 Hassan. All rights reserved.
//

import Foundation
import  Moya


let BASE_URL = "https://elmenus-task.getsandbox.com/"



protocol APISManagerProtocol {
    func sendCustomRequest<T:Codable , M : TargetType>(model : T.Type , targetMoya : M , completion: @escaping (Result<T, Error>) -> Void)
}


struct APISMAnager  : APISManagerProtocol {

    func sendCustomRequest<T:Codable , M : TargetType>(model : T.Type , targetMoya : M , completion: @escaping (Result<T, Error>) -> Void) {
           
           let provider = MoyaProvider<M>(plugins: [NetworkLoggerPlugin(verbose: true)])
           
//           ANActivityIndicatorPresenter.shared.showIndicator()
//           NetworkLogger.log(request: targetMoya)
        
        if targetMoya.showIndicator {
            ANActivityIndicatorPresenter.shared.showIndicator()
        }else{
//            UIApplication.shared.isNetworkActivityIndicatorVisible = true

        }
        
        
        _ = provider.request(targetMoya, completion: { (result) in
            
            if targetMoya.showIndicator{
                ANActivityIndicatorPresenter.shared.hideIndicator()
            }else{
//                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
            
            switch result {
                
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    let modelDecoded = try decoder.decode(model.self, from: response.data)
                    print(modelDecoded)
                    
                    completion(.success(modelDecoded))
                    
                }catch{
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            @unknown default: break
                
            }
            
            
        })
        
        
       }

}
