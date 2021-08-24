//
//  EmployeeListWorker.swift
//  BiofourmisAssignment
//
//  Created by kumar praveen on 24/08/21.
//

import Foundation

class EmployeeListWorker{
    
    /// This func is used to call API from networkLayer and give response and error
    /// - Parameter completionHandler: completion handler will return after async call
    /// - Returns: data in form of EmployeeListModel or NSError
    class func getEmployeeList(completionHandler: @escaping (_ Data: EmployeeListModel?, _ error: NSError?) -> ()){
        NetworkLayer.sharedInstance.makeGetRequest("https://reqres.in/api/users?page=2", parameters: nil, completionHandler: {(response, error) in
            var resposeError : NSError? = nil
            var successData  : EmployeeListModel? = nil
            if let error = error{
                resposeError = error as NSError
            }
            if error == nil{
                do{
                    if let responceToRawData =  try response?.rawData(){
                        successData = try JSONDecoder().decode(EmployeeListModel.self, from: responceToRawData)
                    }
                }catch let err {
                    resposeError = err as NSError
                }
            }
            completionHandler(successData,resposeError)
        })
    }
    
}
