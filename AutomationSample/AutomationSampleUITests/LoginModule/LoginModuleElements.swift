//
//  LoginModuleElements.swift
//  AutomationSampleUITests
//
//  Created by Midhunlal on 11/08/20.
//  Copyright © 2020 Midhunlal. All rights reserved.
//

import XCTest

enum LoginModuleElements: String {
    case usernameTextField = "username_TextField"
    case passwordTextField = "password_TextField"
    case loginButton = "login_Button"
    
    var value: XCUIElement {
        switch self {
        case .usernameTextField:
            return XCUIApplication().textFields[self.rawValue]
        case .passwordTextField:
            return XCUIApplication().secureTextFields[self.rawValue]
        case .loginButton:
            return XCUIApplication().buttons[self.rawValue]
        }
    }
}
