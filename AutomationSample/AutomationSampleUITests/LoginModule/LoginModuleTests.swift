//
//  LoginModuleTests.swift
//  AutomationSampleUITests
//
//  Created by Midhunlal on 11/08/20.
//  Copyright © 2020 Midhunlal. All rights reserved.
//

import XCTest

class LoginModuleTests: AutomationSampleBaseUITests {
    func testInvalidLogin_EmptyCredentials() {
        LoginModuleSteps.givenAppIsReady()
        LoginModuleSteps.whenLogin()
        LoginModuleSteps.thenShouldSeeAlert(withTitle: "Error", message: "Please provide login details")
    }
    
    func testInvalidLogin_EmptyUsername() {
        LoginModuleSteps.givenAppIsReady()
        LoginModuleSteps.whenEnterPassword("12345")
        LoginModuleSteps.whenLogin()
        LoginModuleSteps.thenShouldSeeAlert(withTitle: "Error", message: "Please provide username")
    }
    
    func testInvalidLogin_EmptyPassword() {
        LoginModuleSteps.givenAppIsReady()
        LoginModuleSteps.whenEnterUsername("testUser")
        LoginModuleSteps.whenLogin()
        LoginModuleSteps.thenShouldSeeAlert(withTitle: "Error", message: "Please provide password")
    }
    
    func testInvalidLogin_InvalidUser() {
        LoginModuleSteps.givenAppIsReady()
        LoginModuleSteps.whenEnterUsername("testUser")
        LoginModuleSteps.whenEnterPassword("147399")
        LoginModuleSteps.whenLogin()
        LoginModuleSteps.thenShouldSeeAlert(withTitle: "Error", message: "Invalid user")
    }
    
    func testLoginSuccess() {
        LoginModuleSteps.givenAppIsReady()
        LoginModuleSteps.whenEnterUsername("admin")
        LoginModuleSteps.whenEnterPassword("12345")
        LoginModuleSteps.whenLogin()
        LoginModuleSteps.thenShouldSeeScreen(withTitle: "Home")
    }
}
