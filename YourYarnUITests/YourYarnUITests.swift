//
//  YourYarnUITests.swift
//  YourYarnUITests
//
//  Created by Hana Mahmoud on 06/07/2024.
//

import XCTest


final class YourYarnUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    func testValidLogin() throws {

        let app = XCUIApplication()
        app.launch()
        
        let button = app.buttons["Login"]
        XCTAssertTrue(button.exists)
        button.tap()
        
        let emailField = app.textFields["Email"]
        XCTAssertTrue(emailField.exists)
        
        emailField.tap()
        emailField.typeText("hana.amr.mahmoud@gmail.com")
        
        let passwordField = app.secureTextFields["Password"]
        XCTAssertTrue(passwordField.exists)
        
        passwordField.tap()
        passwordField.typeText("password")
        
        let button2 = app.buttons["Login"]
        XCTAssertTrue(button2.exists)
        button2.tap()
    
        let homePage = app.staticTexts["Home view"]
        XCTAssertTrue(homePage.exists)
    }


    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
