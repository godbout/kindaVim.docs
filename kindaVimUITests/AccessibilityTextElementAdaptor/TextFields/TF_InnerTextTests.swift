import XCTest

class TF_InnerTextTests: AEA_BaseTests {}

// from AXUIElement to AccessibilityElement
extension TF_InnerTextTests {

    func test_that_the_innerText_matches_the_AXUIElement_text_for_TextField() {
        let textInAXFocusedElement = "that's the text that is in the TextField..."
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        let accessibilityElement = AccessibilityElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.internalText, textInAXFocusedElement)
    }

}

// from AccessibilityElement to AXUIElement
// REMINDER:
// internalText is for AccessibilityElement internal use only
// to search where to position the caret.
// this does not set the text of the focused AXUIElement (slow, flickers)
// which is why we don't have test here for innerText
extension TF_InnerTextTests {}
