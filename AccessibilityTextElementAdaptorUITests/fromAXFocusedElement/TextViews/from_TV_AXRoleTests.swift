import XCTest

class from_TV_AXRoleTests: ATEA_BaseTests {
    
    func test_that_the_role_for_TextViews_is_correct() {
        let textInAXFocusedElement = """
hehe a big
TextView
hehe
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.role, .textArea)
    }

}
