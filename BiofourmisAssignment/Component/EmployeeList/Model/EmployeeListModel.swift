//
//  EmployeeListModel.swift
//  BiofourmisAssignment
//
//  Created by kumar praveen on 24/08/21.
//

import Foundation

// MARK: - EmployeeListModel

struct EmployeeListModel: Codable {
    let data: [EmployeData]?
}

// MARK: - Datum
struct EmployeData: Codable {
    let email, firstName, lastName: String?
    let avatar: String?
    
    enum CodingKeys: String, CodingKey {
        case email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}
