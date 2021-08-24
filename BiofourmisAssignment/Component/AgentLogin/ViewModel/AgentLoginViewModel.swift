//
//  AgentLoginViewModel.swift
//  BiofourmisAssignment
//
//  Created by kumar praveen on 25/08/21.
//

import Foundation
import UIKit

class AgentLoginViewModel{
    
    func getEmailErrorMsg()->String{
        return Msg.emailErrorMsg
    }
    
    func getPassworrdErrorMsg()->String{
        return Msg.passwordErrorMsg
    }
    
    func getAlertMsg()->String{
        return Msg.errorEmailAlertMsg
    }
    
    func getAlertTitleMsg()->String{
        return Msg.errorEmailAlertTitleMsg
    }
    
    func loginLogic(emailTextField : UITextField , passwordTextField : UITextField , emailErrorLabel: UILabel , passwordErrorLabel : UILabel , viewController : UIViewController){
        if !emailTextField.text.optionalValue.isEmpty && !passwordTextField.text.optionalValue.isEmpty && emailErrorLabel.isHidden == true , passwordErrorLabel.isHidden == true{
            if emailTextField.text.optionalValue.trimmed() != Msg.hardCodedEmailId || passwordTextField.text.optionalValue.trimmed() != Msg.hardCodedPassword{
                let alert = UIAlertController(title: Msg.errorEmailAlertTitleMsg, message: Msg.errorEmailAlertMsg, preferredStyle: .alert)
                alert.addAction( UIAlertAction(title: Msg.okMsg, style: .default, handler: nil))
                viewController.present(alert, animated: true, completion: nil)
            }else{
                // seting USERDDEFAULT as true o mainttain login state
                AppHelper.setBool(true, forKey: UserDefault.isUserLogedIn)
                if let vc = EmployeListTableViewController.getComponentViewController() as? EmployeListTableViewController{
                    let navigationVC = UINavigationController(rootViewController: vc)
                    viewController.present(navigationVC, animated: true, completion: nil)
                }
            }
        }
    }
    
}
