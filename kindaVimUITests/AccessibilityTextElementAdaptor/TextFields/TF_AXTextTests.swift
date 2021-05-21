import XCTest

class TF_AXTextTests: ATEA_BaseTests {}

// from AXUIElement
extension TF_AXTextTests {

    func test_that_the_AXText_matches_the_AXUIElement_text_for_TextField() {
        let textInAXFocusedElement = "that's the text that is in the TextField..."
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [])

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.axText, textInAXFocusedElement)
    }

}

// to AXUIElement
// REMINDER:
// internalText is for AccessibilityTextElement internal use only
// to search where to position the caret.
// this does not set the text of the focused AXUIElement (slow, flickers)
// which is why we don't have test here for innerText
extension TF_AXTextTests {}
