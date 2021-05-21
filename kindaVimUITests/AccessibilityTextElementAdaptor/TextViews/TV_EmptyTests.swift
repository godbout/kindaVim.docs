import XCTest

class TV_EmptyTests: ATEA_BaseTests {}

// from AXUIElement
extension TV_EmptyTests {

    func test_that_it_does_not_convert_to_an_AccessibilityTextElement_if_the_TextField_is_empty() {
        let textInAXFocusedElement = ""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertNil(accessibilityElement)
    }

}

// to AXUIElement
// REMINDER:
// internalText is for AccessibilityTextElement internal use only
// to search where to position the caret, if we are at the end of text for block cursor, etc.
// this does not set the text of the focused AXUIElement (slow, flickers)
// which is why we need to set it first through the tap and typeText methods
extension TV_EmptyTests {

    func test_that_it_does_not_convert_to_an_AXUIElement_if_the_TextView_is_empty() {
        let text = ""
        let accessibilityElement = AccessibilityTextElement(
            axText: "",
            axCaretLocation: 0
        )

        let textInAXFocusedElement = text
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        let conversionSucceeded = AccessibilityTextElementAdaptor.toAXFocusedElememt(from: accessibilityElement)
        XCTAssertFalse(conversionSucceeded)
    }

}
