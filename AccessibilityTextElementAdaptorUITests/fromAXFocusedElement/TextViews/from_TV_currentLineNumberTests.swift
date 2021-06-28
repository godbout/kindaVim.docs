import XCTest

class from_TV_currentLineNumberTests: ATEA_BaseTests {

    func test_that_in_normal_setting_the_line_number_is_correct() {
        let textInAXFocusedElement = """
line number should
be 3 on that one
because it's on the
third line LMAO
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [])

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.currentLine.number, 3)
    }
    
    func test_that_line_number_is_equal_to_0_if_the_caret_is_at_the_beginning_of_a_TextView() {
        let textInAXFocusedElement = """
line number should
be 1 at
the start
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [.command])

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.currentLine.number, 1)
    }

    func test_that_line_number_is_correct_if_the_caret_is_at_the_beginning_of_a_line_for_a_TextView() {
        let textInAXFocusedElement = """
line number should
be 3
this time!
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [.command])

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.currentLine.number, 3)
    }

    func test_that_line_number_is_correct_if_the_caret_is_at_the_end_of_a_line_for_a_TextView() {
        let textInAXFocusedElement = """
line number should
be 2 at
because yes
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [.command])

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.currentLine.number, 2)
    }

    func test_that_line_number_is_correct_if_the_caret_is_at_the_end_on_a_non_empty_line() {
        let textInAXFocusedElement = """
line number is gonna
be nil elsesub
i will kill Apple
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.currentLine.number, 3)
    }
    
    func test_that_line_number_is_correct_if_the_caret_is_at_the_end_on_an_empty_line() {
        let textInAXFocusedElement = """
somehow
the fucking line number
should still be ok

"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.currentLine.number, 4)
    }

}
