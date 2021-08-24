//
//  EmployeeDdetailViewController.swift
//  BiofourmisAssignment
//
//  Created by kumar praveen on 24/08/21.
//

import UIKit

class EmployeeDetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var emplyeDetail : EmployeData?
    var employeeVM = EmployeeDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.employeeVM.setData(emplyeDetail : emplyeDetail)
        self.title = employeeVM.getFirstName()
        employeeVM.setDetailView(emoloyeeName: nameLabel, employeeEmail: emailLabel, employeeImage: imageView)
    }
    
    class func getComponentViewController() -> UIViewController {
        return UIViewController.getViewControllerWith(storyBoardID: StoryBoardName.EmployeeDetailStoryboard, ViewControllerID: ViewControllerName.EmployeeDetailViewController)
    }
    

}
