//
//  EmployeListViewModel.swift
//  BiofourmisAssignment
//
//  Created by kumar praveen on 24/08/21.
//

import Foundation
import UIKit

class EmployeeListViewModel{
    
    var userModel : [EmployeData]?
    
    func setData(_ userModel : EmployeeListModel) {
        self.userModel = userModel.data
    }
    
    func numberOfRowsInSection()->Int{
        if let count = userModel?.count{
            print(count)
            return count
        }
        return Int.zero
    }
    
    func getEmployeeDataFromIndex(_ indexPath : IndexPath)->EmployeData?{
        if let userModel = userModel{
            return userModel[indexPath.row]
        }
        return nil
    }
    
    func setname(_ nameLabel : UILabel ,_ emplyeDetail : EmployeData?){
        if let firstName = emplyeDetail?.firstName{
            nameLabel.text = String(format: Msg.nameFormaedString, firstName,String())
            if let lastname = emplyeDetail?.lastName{
                nameLabel.text = String(format: Msg.nameFormaedString, firstName,lastname)
            }
        }
    }
    
    func setEmail(_ emailLabel : UILabel,_ emplyeDetail : EmployeData?){
        if let email = emplyeDetail?.email{
            emailLabel.text = String(format: Msg.emailFormatedString, email)
        }
    }
    
    func setImage(_ imageView : UIImageView,_ emplyeDetail : EmployeData?){
        if let image = emplyeDetail?.avatar{
            let url = URL(string: image)!
            if let data = try? Data(contentsOf: url) {
                imageView.image = UIImage(data: data)
            }
        }
    }
    
    func setDetailView(emoloyeeName : UILabel , employeeEmail : UILabel , employeeImage : UIImageView, emplyeDetail : EmployeData?){
        setname(emoloyeeName,emplyeDetail)
        setEmail(employeeEmail,emplyeDetail)
        setImage(employeeImage,emplyeDetail)
    }
    
}
