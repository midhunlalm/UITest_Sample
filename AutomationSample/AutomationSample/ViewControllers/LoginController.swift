//
//  LoginController.swift
//  AutomationSample
//
//  Created by Midhunlal on 02/08/20.
//  Copyright © 2020 Midhunlal. All rights reserved.
//

import UIKit

class LoginController: BaseViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInterface()
    }
    
    //MARK: - Button Actions
    @IBAction func didTapLoginButton(_ sender: Any) {
        let username = usernameTextField.text
        let password = passwordTextField.text
        if validateInput(username: username, password: password) {
            loginUser(username: username, password: password)
        }
    }
}

//MARK: - Private Methods
private extension LoginController {
    func setupInterface() {
        navigationItem.title = "Login"
        usernameTextField.placeholder = "Username"
        usernameTextField.delegate = self
        usernameTextField.accessibilityLabel = "username_TextField"
        
        passwordTextField.placeholder = "Password"
        passwordTextField.delegate = self
        passwordTextField.isSecureTextEntry = true
        passwordTextField.accessibilityLabel = "password_TextField"
        
        loginButton.accessibilityLabel = "login_Button"
    }
    
    func validateInput(username: String?, password: String?) -> Bool {
        if username?.isEmpty == true && password?.isEmpty == true {
            showAlert(title: "Error", message: "Please provide login details")
            return false
        }
        
        if username?.isEmpty == true && password?.isEmpty == false {
            showAlert(title: "Error", message: "Please provide username")
            return false
        }
        
        if username?.isEmpty == false && password?.isEmpty == true {
            showAlert(title: "Error", message: "Please provide password")
            return false
        }
        
        return true
    }
    
    func clearTextField() {
        usernameTextField.text = nil
        passwordTextField.text = nil
    }
    
    func loginUser(username: String?, password: String?) {
        if username == "admin" && password == "12345" {
            clearTextField()
            showHomeController()
        } else {
            showAlert(title: "Error", message: "Invalid user")
        }
    }
}

//MARK: - Routing
private extension LoginController {
    func showHomeController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeController") as? HomeController {
            self.navigationController?.pushViewController(homeVC, animated: true)
        }
    }
}

//MARK: - UITextFieldDelegate
extension LoginController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}
