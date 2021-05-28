import XCTest

class from_TF_AXTextTests: ATEA_BaseTests {
    
    func test_that_the_AXText_matches_the_AXUIElement_text_for_TextField() {
        let textInAXFocusedElement = "that's the text that is in the TextField..."
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [])

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.value, textInAXFocusedElement)
    }

}
