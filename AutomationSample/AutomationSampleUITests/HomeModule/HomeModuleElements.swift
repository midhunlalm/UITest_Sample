//
//  HomeModuleElements.swift
//  AutomationSampleUITests
//
//  Created by Midhunlal on 11/08/20.
//  Copyright © 2020 Midhunlal. All rights reserved.
//

import XCTest

enum HomeModuleElements: String {
    case tableView = "items_TableView"
    case activityIndicator = "activityIndicator_View"
    
    var value: XCUIElement {
        switch self {
        case .tableView:
            return XCUIApplication().tables[self.rawValue]
        case .activityIndicator:
            return XCUIApplication().activityIndicators[self.rawValue]
        }
    }
}
