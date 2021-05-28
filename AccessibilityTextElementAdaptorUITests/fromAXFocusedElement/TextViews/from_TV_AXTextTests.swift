import XCTest

class from_TV_AXTextTests: ATEA_BaseTests {

    func test_that_the_AXText_matches_the_AXUIElement_text_for_TextView() {
        let textInAXFocusedElement = """
that's a way longer text
    that is gonna go into a TextView my friend
which is like a TextField but
has
multilines
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [])

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.value, textInAXFocusedElement)
    }

}
