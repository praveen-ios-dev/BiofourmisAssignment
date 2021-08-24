//
//  EmployeListTableViewCell.swift
//  BiofourmisAssignment
//
//  Created by kumar praveen on 20/08/21.
//

import UIKit

class EmployeListTableViewCell: UITableViewCell {
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var avtar: UIImageView!
    
    var employeVM = EmployeeListViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setCellData(_ data : EmployeData?){
        employeVM.setDetailView(emoloyeeName: fullNameLabel, employeeEmail: emailLabel, employeeImage: avtar, emplyeDetail: data)
    }
}
