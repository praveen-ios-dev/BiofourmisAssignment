//
//  BiofourmisConstant.swift
//  BiofourmisAssignment
//
//  Created by kumar praveen on 24/08/21.
//

import Foundation

struct StoryBoardName {
    static let AgentLoginStoryboard = "AgentLoginViewController"
    static let EmployeeListStoryboard = "EmployeListTableViewController"
    static let EmployeeDetailStoryboard = "EmployeeDetailViewController"
    
}

struct ViewControllerName {
    static let AgentLoginViewController = "AgentLoginViewController"
    static let EmployeeListViewController = "EmployeListTableViewController"
    static let EmployeeDetailViewController = "EmployeeDetailViewController"
}

struct ReuseIdentifier{
    static let employeListTableViewCell = "EmployeListTableViewCell"
}


struct UserDefault {
    static let isUserLogedIn = "isUserLogedIn"
}

struct Msg{
    static let emailErrorMsg = "Email should contain @"
    static let passwordErrorMsg = "Password should be more than 8 char"
    static let errorEmailAlertMsg = "Please use email as 'eve.holt@reqres.in' and password as 'password123'"
    static let errorEmailAlertTitleMsg = "Warning"
    static let hardCodedEmailId = "eve.holt@reqres.in"
    static let hardCodedPassword = "password123"
    static let okMsg = "OK"
    static let nameFormaedString = "Name : %@ %@"
    static let emailFormatedString = "Email : %@"
    static let logout = "Logout"
}
