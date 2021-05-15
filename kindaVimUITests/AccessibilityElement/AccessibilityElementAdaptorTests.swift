import XCTest

class AccessibilityElementAdaptorTests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

}

// from AccessibilityElement to AXUIElement
extension AccessibilityElementAdaptorTests {

//    func test_that_it_can_convert_an_AccessibilityElement_to_an_AXUIElement() {
//        let app = XCUIApplication()
//        app.launch()
//
//        let textTyped = "hello you dear"
//        let accessibilityElement = AccessibilityElement(
//            text: textTyped,
//            caretLocation: 3
//        )
//
//        app.textFields.firstMatch.tap()
//        app.textFields.firstMatch.typeText(textTyped)
//
//        let conversionSucceeded = AccessibilityElementAdaptor.toAXFocusedElememt(from: accessibilityElement)
//
//        XCTAssertTrue(conversionSucceeded)
//
//        let checkBackAccessibilityElement = AccessibilityElementAdaptor.fromAXFocusedElement()
//
//        XCTAssertEqual(checkBackAccessibilityElement?.text, textTyped)
//        XCTAssertEqual(checkBackAccessibilityElement?.caretLocation, 3)
//    }

}

// from AXUIElement to AccessibilityElement
extension AccessibilityElementAdaptorTests {

    func test_that_it_can_convert_a_single_line_text_field_to_an_AccessibilityElement() {
        let app = XCUIApplication()
        app.launch()

        let textTyped = "some text we will set in some fake UIElement"

        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textTyped)
        for _ in 1...5 {
            app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [])
        }

        let accessibilityElement = AccessibilityElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.text, textTyped)
        XCTAssertEqual(accessibilityElement?.caretLocation, textTyped.count - 5)
    }

    func test_that_it_can_convert_a_multiple_line_text_field_to_an_AccessibilityElement() {
        let app = XCUIApplication()
        app.launch()

        let textTyped =
            """
            well that's supposed to be a text view
            so like you can type many lines
                and it's like super cool.
            """

        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textTyped)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        for _ in 1...7 {
            app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [])
        }

        let accessibilityElement = AccessibilityElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.text, textTyped)
        XCTAssertEqual(accessibilityElement?.caretLocation, 45)
    }

    func test_that_trying_to_convert_a_button_returns_nil() {
        let app = XCUIApplication()
        app.launch()

        app.buttons.firstMatch.tap()

        let accessibilityElement = AccessibilityElementAdaptor.fromAXFocusedElement()

        XCTAssertNil(accessibilityElement)
    }

}

