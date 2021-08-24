//
//  ViewController.swift
//  BiofourmisAssignment
//
//  Created by kumar praveen on 20/08/21.
//

import UIKit

class AgentLoginViewController: UIViewController {
    //MARK:- @IBOutlet
    @IBOutlet weak private var emailTextField: UITextField!
    @IBOutlet weak private var passwordTextField: UITextField!
    @IBOutlet weak private var emailErrorLabel: UILabel!
    @IBOutlet weak private var passwordErrorLabel: UILabel!
    @IBOutlet weak private var loginButton: UIButton!
    @IBOutlet weak private var scrollView: UIScrollView!
    @IBOutlet weak private var activeTextField: UITextField!
    
    var agentLoginVM = AgentLoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    class func getComponentViewController() -> UIViewController {
        return UIViewController.getViewControllerWith(storyBoardID: StoryBoardName.AgentLoginStoryboard, ViewControllerID: ViewControllerName.AgentLoginViewController)
    }
    
    //MARK:- Fileprivate func
    
    fileprivate func setupUI(){
        passwordTextField.delegate = self
        emailTextField.delegate = self
        emailTextField.becomeFirstResponder()
        emailErrorLabel.isHidden = true
        passwordErrorLabel.isHidden = true
        self.registeringKeyboard()
        self.keyboardBackgroundTap()
    }
    
    fileprivate func updateUIForTextFieldChange(_ textField: UITextField){
        let currentString: NSString = textField.text! as NSString
        let trimmedString = currentString.trimmingCharacters(in: CharacterSet.whitespaces)
        if textField == emailTextField && !trimmedString.contains("@"){
            emailErrorLabel.isHidden = false
            emailErrorLabel.text = agentLoginVM.getEmailErrorMsg()
        }
        if textField == passwordTextField && (trimmedString.count < 8){
            passwordErrorLabel.isHidden = false
            passwordErrorLabel.text = agentLoginVM.getPassworrdErrorMsg()
        }
    }
    
    //MARK:- @IBAction
    @IBAction func loginButtonClicked(_ sender: Any) {
        agentLoginVM.loginLogic(emailTextField: emailTextField, passwordTextField: passwordTextField, emailErrorLabel: emailErrorLabel, passwordErrorLabel: passwordErrorLabel, viewController: self)
    }
    
}


extension AgentLoginViewController : UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField{
            passwordTextField.becomeFirstResponder()
        }else{
            textField.resignFirstResponder()
            agentLoginVM.loginLogic(emailTextField: emailTextField, passwordTextField: passwordTextField, emailErrorLabel: emailErrorLabel, passwordErrorLabel: passwordErrorLabel, viewController: self)
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if activeTextField == nil {
            activeTextField = textField
        }else{
            updateUIForTextFieldChange(activeTextField)
            activeTextField = textField
            if textField == passwordTextField{
                passwordErrorLabel.isHidden = true
            }else{
                emailErrorLabel.isHidden = true
            }
        }
    }
    
}



//MARK:- Keyboard Notification

extension AgentLoginViewController{
    
    fileprivate func registeringKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    @objc func resignKeyboard(){
        self.isEditing = false
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    fileprivate func keyboardBackgroundTap() {
        let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(resignKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let yKeyboard = self.view.frame.height - (keyboardSize.height + 50)
            let deltaDistance = yKeyboard -  self.loginButton.frame.origin.y
            if deltaDistance < 0{
                var contentInset:UIEdgeInsets = self.scrollView.contentInset
                contentInset.bottom = keyboardSize.height + 20
                self.scrollView.contentInset = contentInset
                self.scrollView.scrollIndicatorInsets = contentInset
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        self.scrollView.contentOffset = CGPoint.zero
        self.scrollView.contentInset = contentInset
        self.scrollView.scrollIndicatorInsets = contentInset
    }
}
