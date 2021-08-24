//
//  EmployeListTableViewController.swift
//  BiofourmisAssignment
//
//  Created by kumar praveen on 20/08/21.
//

import UIKit

class EmployeListTableViewController: UITableViewController{
    
    var employeeListVM = EmployeeListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.tableView.register(UINib(nibName: ReuseIdentifier.employeListTableViewCell, bundle: nil), forCellReuseIdentifier: ReuseIdentifier.employeListTableViewCell)
        addRightBarButton()
        getdata()
    }
    
    class func getComponentViewController() -> UIViewController {
        return UIViewController.getViewControllerWith(storyBoardID: StoryBoardName.EmployeeListStoryboard, ViewControllerID: ViewControllerName.EmployeeListViewController)
    }
    
    func getdata(){
        tableView.showLoading()
        EmployeeListWorker.getEmployeeList(){(response , error) in
            self.tableView.stopLoading()
            if let response = response{
                self.employeeListVM.setData(response)
                self.tableView.reloadData()
                self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
            }
            
        }
    }
    
    func addRightBarButton(){
        let button1 = UIBarButtonItem(title: Msg.logout, style: .plain, target: self, action: #selector(self.action))
        self.navigationItem.rightBarButtonItem  = button1
    }
    
    @objc func action(){
        AppHelper.setBool(false, forKey: UserDefault.isUserLogedIn)
        (self.view.window?.windowScene?.delegate as? SceneDelegate)?.resetRoot()
    }
    
    

    // MARK: - Table view data source

   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeListVM.numberOfRowsInSection()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell  = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifier.employeListTableViewCell, for: indexPath) as? EmployeListTableViewCell{
            cell.setCellData(employeeListVM.getEmployeeDataFromIndex(indexPath))
            return cell
        }
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = EmployeeDetailViewController.getComponentViewController() as? EmployeeDetailViewController{
            vc.emplyeDetail = employeeListVM.getEmployeeDataFromIndex(indexPath)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

}
