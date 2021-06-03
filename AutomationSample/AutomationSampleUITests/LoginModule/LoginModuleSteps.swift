//
//  LoginModuleSteps.swift
//  AutomationSampleUITests
//
//  Created by Midhunlal on 11/08/20.
//  Copyright © 2020 Midhunlal. All rights reserved.
//

import XCTest

class LoginModuleSteps: AutomationSampleBaseUITests {
    class func givenAppIsReady() {
        XCTAssertTrue(LoginModuleElements.usernameTextField.value.exists)
        XCTAssertTrue(LoginModuleElements.passwordTextField.value.exists)
        XCTAssertTrue(LoginModuleElements.loginButton.value.exists)
    }
    
    class func whenEnterUsername(_ text: String) {
        let usernameTextField = LoginModuleElements.usernameTextField.value
        usernameTextField.tap()
        usernameTextField.typeText(text)
    }
    
    class func whenEnterPassword(_ text: String) {
        let passwordTextField = LoginModuleElements.passwordTextField.value
        passwordTextField.tap()
        passwordTextField.typeText(text)
    }
    
    class func whenLogin() {
        let loginButton = LoginModuleElements.loginButton.value
        XCTAssertTrue(loginButton.exists)
        loginButton.tap()
    }
    
    class func thenShouldSeeAlert(withTitle title: String, message: String) {
        let alert = XCUIApplication().alerts[title]
        XCTAssertTrue(alert.exists)
        
        let alertText = alert.scrollViews.otherElements.staticTexts[message]
        XCTAssertTrue(alertText.exists)
        
        let alertButton = alert.scrollViews.otherElements.buttons["OK"]
        XCTAssertTrue(alertButton.exists)
        alertButton.tap()
    }
}
