import XCTest

class from_TV_currentLineEndTests: ATEA_BaseTests {

    func test_that_the_line_end_is_nil_for_an_empty_TextView() {
        let textInAXFocusedElement = ""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertNil(accessibilityElement?.currentLine.end)
    }
    
    func test_that_the_line_end_is_nil_if_caret_is_at_the_beginning_of_a_TextView() {
        let textInAXFocusedElement = """
line end is still nil
even if it's a TextView
when caret is at the end of it
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertNil(accessibilityElement?.currentLine.end)
    }
    
    func test_that_the_line_end_is_nil_if_caret_is_at_the_end_of_a_TextView() {
        let textInAXFocusedElement = """
so
that shit
at the
and see
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertNil(accessibilityElement?.currentLine.end)
    }

    func test_that_the_line_end_is_correct_if_caret_is_anywhere_in_between() {
        let textInAXFocusedElement = """
hello
bah bha bah
is there anyone at home?
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [.command])
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [])
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [])

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.currentLine.end, 18)
    }

}
