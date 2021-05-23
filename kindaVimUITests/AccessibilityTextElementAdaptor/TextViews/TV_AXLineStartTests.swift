import XCTest

class TV_AXLineStartTests: ATEA_BaseTests {}

// from AXUIElement
extension TV_AXLineStartTests {
    
    func test_that_the_line_start_is_nil_for_an_empty_TextView() {
        let textInAXFocusedElement = ""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertNil(accessibilityElement?.axLineStart)
    }

    func test_that_the_line_start_is_equal_to_0_if_caret_is_at_the_beginning_of_a_non_empty_TextView() {
        let textInAXFocusedElement = """
caret will go to the beginning so the line
start is supposed to
0!
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [.command])

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.axLineStart, 0)
    }
    
    func test_that_the_line_start_is_nil_if_caret_is_at_the_end_of_a_TextView() {
        let textInAXFocusedElement = """
so we gonna position
that shit (the caret)
at the end
and see if we can again blow up that whole shit!
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertNil(accessibilityElement?.axLineStart)
    }

    func test_that_the_line_start_is_correct_if_caret_is_anywhere_in_between() {
        let textInAXFocusedElement = """
hello
is there anybody out there
just knock if you can hear me
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

        XCTAssertEqual(accessibilityElement?.axLineStart, 63)
    }

}

// to AXUIElement
// same. no idea if we're ever gonna set the line start or not
extension TV_AXLineStartTests {}
