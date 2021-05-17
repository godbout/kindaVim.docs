import XCTest

class InnerTextTests: AEA_BaseTests {}

// TextFields
extension InnerTextTests {

    func test_that_the_innerText_matches_the_AXUIElement_text_for_TextField() {
        let textInAXFocusedElement = "that's the text that is in the TextField..."
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        let accessibilityElement = AccessibilityElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.internalText, textInAXFocusedElement)
    }

}

// TextViews
extension InnerTextTests {

    func test_that_the_innerText_matches_the_AXUIElement_text_for_TextView() {
        let textInAXFocusedElement = """
        that's a way longer text
            that is gonna go into a TextView my friend
        which is like a TextField but
        has
        multilines
        """
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)

        let accessibilityElement = AccessibilityElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.internalText, textInAXFocusedElement)
    }

}
