import XCTest

class NonTextElementsTests: AEA_BaseTests {}

// from AXUIElement to AccessibilityElement
extension NonTextElementsTests {

    func test_that_trying_to_convert_an_AXUIElement_button_to_an_AccessibilityElement_returns_nil() {
        app.buttons.firstMatch.tap()

        let accessibilityElement = AccessibilityElementAdaptor.fromAXFocusedElement()

        XCTAssertNil(accessibilityElement)
    }

}

// from AccessibilityElement to AXUIElement
extension NonTextElementsTests {

    func test_that_trying_to_convert_an_AccessibilityElement_to_an_AXUIElement_button_returns_false() {
        let accessibilityElement = AccessibilityElement(
            internalText: "hi i'm a button",
            caretLocation: 5,
            lineStart: 0
        )

        app.buttons.firstMatch.tap()

        let conversionSucceeded = AccessibilityElementAdaptor.toAXFocusedElememt(from: accessibilityElement)

        XCTAssertFalse(conversionSucceeded)
    }

}
