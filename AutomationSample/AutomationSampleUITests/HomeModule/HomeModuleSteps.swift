//
//  HomeModuleSteps.swift
//  AutomationSampleUITests
//
//  Created by Midhunlal on 11/08/20.
//  Copyright © 2020 Midhunlal. All rights reserved.
//

import XCTest

class HomeModuleSteps: AutomationSampleBaseUITests {
    class func shouldSeeActivityIndicator() {
        let activityIndicator = HomeModuleElements.activityIndicator.value
        XCTAssertTrue(activityIndicator.exists)
    }
    
    class func waitToDownloadData() {
        let tableView = HomeModuleElements.tableView.value
        AutomationSampleBaseUITests.asyncAssert(element: tableView, timeInterval: 5)
    }
    
    class func whenSelectCellWithText(_ text: String) {
        let tableView = HomeModuleElements.tableView.value
        let cell = tableView.staticTexts[text]
        XCTAssertTrue(cell.exists)
        cell.tap()
    }
}
