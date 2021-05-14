//
//  AccessibilityElementAdaptorTests.swift
//  kindaVimUITests
//
//  Created by Guillaume Leclerc on 14/05/2021.
//

import XCTest

class AccessibilityElementAdaptorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
//        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    
    func test_that_it_can_convert_an_AccessibilityElement_to_an_AXUIElement() throws {
        
        let textTyped = "some text we will set in some fake UIElement"
        
        let app = XCUIApplication()
        app.launch()
        
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textTyped)
        for _ in 1...5 {
            app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [])
        }
        
//        print(app.textFields.count)
//        print(app.textViews.count)
        
        app.buttons.firstMatch.tap()
        
        let axFocusedElement = try XCTUnwrap(
            AccessibilityStrategy.axFocusedElement()
        )

        let accessibilityElement = AccessibilityElementAdaptor.toAccessibilityElement(from: axFocusedElement)

        XCTAssertEqual(accessibilityElement?.text, "some text we will set in some fake UIElement")
        XCTAssertEqual(accessibilityElement?.caretLocation, textTyped.count - 5)

        // see the two assertions above
        // we will need to create fake UIElement and put some text in it
        // and set caret position, etc...
        // and then focus on those fields before running the tests
        // will be fun...!
        

    }

}
