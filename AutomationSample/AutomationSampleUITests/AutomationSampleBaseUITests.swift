//
//  AutomationSampleBaseUITests.swift
//  AutomationSampleUITests
//
//  Created by Midhunlal on 11/08/20.
//  Copyright © 2020 Midhunlal. All rights reserved.
//

import XCTest

class AutomationSampleBaseUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDown() {
        super.tearDown()
        app = nil
    }
}

//MARK: - Instance Methods
extension AutomationSampleBaseUITests {
    func asyncAssertWithPredicate(element: XCUIElement, timeInterval: TimeInterval) {
        expectation(for: NSPredicate(format: "exists == 1", argumentArray: nil), evaluatedWith: element, handler: nil)
        waitForExpectations(timeout: timeInterval, handler: nil)
        XCTAssertTrue(element.exists)
    }
}

//MARK: - Static Methods
extension AutomationSampleBaseUITests {
    static func asyncAssert(element: XCUIElement, timeInterval: TimeInterval) {
        let isElementExist = element.waitForExistence(timeout: timeInterval)
        XCTAssertTrue(isElementExist)
    }
    
    class func thenShouldSeeScreen(withTitle title: String) {
        XCTAssertTrue(XCUIApplication().navigationBars[title].exists)
    }
}
