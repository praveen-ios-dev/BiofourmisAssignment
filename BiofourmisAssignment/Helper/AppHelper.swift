//
//  AppHelper.swift
//  BiofourmisAssignment
//
//  Created by kumar praveen on 24/08/21.
//

import Foundation

class AppHelper{
    
    class func getBoolForKey(_ key : String)->Bool{
        return UserDefaults.standard.bool(forKey: key)
    }
    
    class func setBool(_ bool : Bool ,forKey: String){
        UserDefaults.standard.set(bool, forKey: forKey)
        UserDefaults.standard.synchronize()
    }
    
}
