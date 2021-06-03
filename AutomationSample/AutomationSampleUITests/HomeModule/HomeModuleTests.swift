//
//  HomeModuleTests.swift
//  AutomationSampleUITests
//
//  Created by Midhunlal on 11/08/20.
//  Copyright © 2020 Midhunlal. All rights reserved.
//

import XCTest

class HomeModuleTests: AutomationSampleBaseUITests {
    func testHomeScreenAction() {
        LoginModuleSteps.givenAppIsReady()
        LoginModuleSteps.whenEnterUsername("admin")
        LoginModuleSteps.whenEnterPassword("12345")
        LoginModuleSteps.whenLogin()
        LoginModuleSteps.thenShouldSeeScreen(withTitle: "Home")
        
        HomeModuleSteps.shouldSeeActivityIndicator()
        HomeModuleSteps.waitToDownloadData()
        HomeModuleSteps.whenSelectCellWithText("Eyeglasses")
        HomeModuleSteps.thenShouldSeeScreen(withTitle: "Details")
    }
}
