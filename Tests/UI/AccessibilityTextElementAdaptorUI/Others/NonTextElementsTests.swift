import XCTest
import AccessibilityStrategy


class NonTextElementsTests: ATEA_BaseTests {}


// from AXUIElement
extension NonTextElementsTests {
    
    func test_that_trying_to_convert_anAXUIElement_window_to_an_AccessibilityTextElement_returns_nil() {
        app.windows.firstMatch.tap()
        
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertNil(accessibilityElement)
    }

    func test_that_trying_to_convert_an_AXUIElement_button_to_an_AccessibilityTextElement_returns_nil() {
        app.buttons.firstMatch.tap()

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertNil(accessibilityElement)
    }

}


// to AXUIElement
extension NonTextElementsTests {

    func test_that_trying_to_convert_an_AccessibilityTextElement_to_an_AXUIElement_button_returns_false() {
        let accessibilityElement = AccessibilityTextElement(
            value: "hi i'm a button",
            length: 25,
            caretLocation: 5,
            selectedLength: 1
        )

        app.buttons.firstMatch.tap()

        let conversionSucceeded = AccessibilityTextElementAdaptor.toAXFocusedElement(from: accessibilityElement)

        XCTAssertFalse(conversionSucceeded)
    }

}
