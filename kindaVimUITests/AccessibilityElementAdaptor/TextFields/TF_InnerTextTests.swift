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
