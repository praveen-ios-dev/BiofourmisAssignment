//
//  EmployeeDetailViewModel.swift
//  BiofourmisAssignment
//
//  Created by kumar praveen on 24/08/21.
//

import Foundation
import UIKit

class EmployeeDetailViewModel{
    var emplyeDetail : EmployeData?
    
    func setData(emplyeDetail : EmployeData?) {
        self.emplyeDetail = emplyeDetail
    }
    
    func setname(_ nameLabel : UILabel){
        if let firstName = emplyeDetail?.firstName{
            nameLabel.text = String(format: Msg.nameFormaedString, firstName,String())
            if let lastname = emplyeDetail?.lastName{
                nameLabel.text = String(format: Msg.nameFormaedString, firstName,lastname)
            }
        }
    }
    
    func setEmail(_ emailLabel : UILabel){
        if let email = emplyeDetail?.email{
            emailLabel.text = String(format: Msg.emailFormatedString, email)
        }
    }
    
    func setImage(_ imageView : UIImageView){
        if let image = emplyeDetail?.avatar{
            let url = URL(string: image)!
            if let data = try? Data(contentsOf: url) {
                imageView.image = UIImage(data: data)
            }
        }
    }
    
    func getFirstName() -> String {
        if let firstName = emplyeDetail?.firstName{
            return firstName
        }
        return String()
    }
    
    func setDetailView(emoloyeeName : UILabel , employeeEmail : UILabel , employeeImage : UIImageView){
        setname(emoloyeeName)
        setEmail(employeeEmail)
        setImage(employeeImage)
    }
    
}
