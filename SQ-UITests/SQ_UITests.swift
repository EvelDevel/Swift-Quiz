//
//  SQ_UITests.swift
//  SQ-UITests
//
//  Created by Evgeny Nikitin on 12.02.2024.
//  Copyright © 2024 Evel-Devel. All rights reserved.
//

import XCTest

final class SQ_UITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    // MARK: - Tap testing
    
    func testHistoryButton() throws {
        XCUIApplication().launch()
        XCUIApplication()/*@START_MENU_TOKEN@*/.buttons["historyButton"]/*[[".buttons[\"История игр\"]",".buttons[\"historyButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    
    func testSettingsButton() throws {
        XCUIApplication().launch()
        XCUIApplication()/*@START_MENU_TOKEN@*/.buttons["settingsButton"]/*[[".buttons[\"n gear lighter\"]",".buttons[\"settingsButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    
    func testGameButton() throws {
        XCUIApplication().launch()
        XCUIApplication().buttons["gameButton"].tap()
    }
    
    func testStatsButton() throws {
        XCUIApplication().launch()
        XCUIApplication().buttons["statsButton"].tap()
    }
    
    func testCategoryButton() throws {
        XCUIApplication().launch()
        XCUIApplication().buttons["categoryButton"].tap()
    }
    
    func testOptionAButton() throws {
        XCUIApplication().launch()
        XCUIApplication().buttons["gameButton"].tap()
        XCUIApplication().buttons["optionA"].tap()
        XCUIApplication().swipeDown(velocity: XCUIGestureVelocity.fast)
        
        XCUIApplication().buttons["continueButton"].tap()
    }
}
