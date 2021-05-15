import XCTest

class AccessibilityElementAdaptorTests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false

        app = XCUIApplication()
        app.launch()
    }

}

// from AccessibilityElement to AXUIElement
extension AccessibilityElementAdaptorTests {

    func test_that_it_can_convert_an_AccessibilityElement_to_an_AXUIElement_text_field() {
        let textTyped = "hello you dear"
        let accessibilityElement = AccessibilityElement(
            text: textTyped,
            caretLocation: 3
        )

        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textTyped)

        let conversionSucceeded = AccessibilityElementAdaptor.toAXFocusedElememt(from: accessibilityElement)

        XCTAssertTrue(conversionSucceeded)

        let reconvertedAccessibilityElement = AccessibilityElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(reconvertedAccessibilityElement?.text, textTyped)
        XCTAssertEqual(reconvertedAccessibilityElement?.caretLocation, 3)
    }

    func test_that_it_can_convert_an_AccessibilityElement_to_an_AXUIElement_text_view() {

    }

    func test_that_trying_to_convert_an_AccessibilityElement_to_an_AXUIElement_button_returns_false() {
        let accessibilityElement = AccessibilityElement(
            text: "hi i'm a button",
            caretLocation: 5
        )

        app.buttons.firstMatch.tap()

        let conversionSucceeded = AccessibilityElementAdaptor.toAXFocusedElememt(from: accessibilityElement)

        XCTAssertFalse(conversionSucceeded)
    }

}

// from AXUIElement to AccessibilityElement
extension AccessibilityElementAdaptorTests {

    func test_that_it_can_convert_an_AXUIElement_text_field_to_an_AccessibilityElement() {
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

    func test_that_it_can_convert_an_AXUIElement_text_view_to_an_AccessibilityElement() {
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

    func test_that_trying_to_convert_an_AXUIElement_button_to_an_AccessibilityElement_returns_nil() {
        app.buttons.firstMatch.tap()

        let accessibilityElement = AccessibilityElementAdaptor.fromAXFocusedElement()

        XCTAssertNil(accessibilityElement)
    }

}

