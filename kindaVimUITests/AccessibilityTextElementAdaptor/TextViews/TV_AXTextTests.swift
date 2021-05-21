import XCTest

class TV_InnerTextTests: AEA_BaseTests {}

// from AXUIElement
extension TV_InnerTextTests {

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

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.axText, textInAXFocusedElement)
    }

}
