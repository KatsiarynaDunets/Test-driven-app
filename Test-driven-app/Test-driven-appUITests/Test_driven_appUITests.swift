//
//  Test_driven_appUITests.swift
//  Test-driven-appUITests
//
//  Created by Kate on 10/01/2024.
//

import XCTest

final class Test_driven_appUITests: XCTestCase {

        override func setUpWithError() throws {
            // Put setup code here. This method is called before the invocation of each test method in the class.

            // In UI tests it is usually best to stop immediately when a failure occurs.
            // если зафейлился то стопим
            continueAfterFailure = false

            // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        }

        override func tearDownWithError() throws {
            // Put teardown code here. This method is called after the invocation of each test method in the class.
        }

        func testExample() throws {
            // UI tests must launch the application that they test.
            // экземпряр приложения + запуск
            let app = XCUIApplication()
            app.launch()
            
            // Use XCTAssert and related functions to verify your tests produce the correct results.
            
            // проверка на то что мы находимся на mainView
            // XCTAssertTrue(app.isMainView)

            app/*@START_MENU_TOKEN@*/.staticTexts["Button"]/*[[".buttons[\"Button\"].staticTexts[\"Button\"]",".staticTexts[\"Button\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

            app.navigationBars["UIView"].buttons["Back"].tap()
            
            app.staticTexts["Button"].tap()

            app.navigationBars["UIView"].buttons["Back"].tap()
            
            app/*@START_MENU_TOKEN@*/.staticTexts["Button"]/*[[".buttons[\"Button\"].staticTexts[\"Button\"]",".staticTexts[\"Button\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

            app.navigationBars["UIView"].buttons["Back"].tap()
            
            app/*@START_MENU_TOKEN@*/.staticTexts["Button"]/*[[".buttons[\"Button\"].staticTexts[\"Button\"]",".staticTexts[\"Button\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

            app.navigationBars["UIView"].buttons["Back"].tap()
            
            
        }

        /// измеряем скорость запуска приложения
        func testLaunchPerformance() throws {
            if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
                // This measures how long it takes to launch your application.
                measure(metrics: [XCTApplicationLaunchMetric()]) {
                    XCUIApplication().launch()
                }
            }
        }
    }


