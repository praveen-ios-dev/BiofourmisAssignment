//
//  NetworkLayer.swift
//  BiofourmisAssignment
//
//  Created by kumar praveen on 24/08/21.
//

import Foundation
import SwiftyJSON
import Alamofire

class NetworkLayer{
    static let sharedInstance = NetworkLayer()
    
    let manager: Alamofire.Session = {
        let configuration = URLSessionConfiguration.default
        configuration.headers = .default
        configuration.timeoutIntervalForRequest = 30
        return Alamofire.Session(
            configuration: configuration
        )
    }()
    
    func makeGetRequest(_ apiType : String,parameters : [String : AnyObject]?, completionHandler: @escaping (_ responseObject: JSON?, _ error: NSError?) -> ()){
        
        let completeUrl = apiType
        manager.request(completeUrl,method: .get, parameters: parameters, headers:nil).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value) as JSON
                completionHandler(json, nil)
                break
            case .failure(_):
                completionHandler(nil, NSError(domain: "", code: response.response?.statusCode ?? 599, userInfo: nil))
                
                break
            }
        }
    }
}
