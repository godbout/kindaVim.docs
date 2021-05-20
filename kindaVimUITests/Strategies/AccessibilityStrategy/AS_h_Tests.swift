import XCTest

class AS_h_Tests: AS_BaseTests {}

// TextFields
extension AS_h_Tests {

    func test_that_in_normal_setting_h_goes_one_character_to_the_left_in_TextFields() {
        let textInAXFocusedElement = "h goes one character to the left"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])

        let returnedElement = accessibilityStrategy.h(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())

        XCTAssertEqual(returnedElement?.caretLocation, 27)
    }

    func test_that_at_the_beginning_of_a_line_h_does_not_move_in_TextFields() {
        let textInAXFocusedElement = "if at the beginning of a line h should not move the caret"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.command])

        let returnedElement = accessibilityStrategy.h(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())

        XCTAssertEqual(returnedElement?.caretLocation, 0)
    }

}

// TextAreas
extension AS_h_Tests {

    func test_that_in_normal_setting_h_goes_one_character_to_the_left_in_TextAreas() {
        let textInAXFocusedElement = """
        h goes one
        character to the
        left even
        in multilines
        """
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])

        let returnedElement = accessibilityStrategy.h(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())

        XCTAssertEqual(returnedElement?.caretLocation, 36)
    }

    func test_that_at_the_beginning_of_a_line_h_does_not_move_up_to_the_prevous_line_in_TextAreas() {
        let textInAXFocusedElement = """
        in multiline if
        at the beginning of a line
        h should not go up to
        the previous line
        """
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [.command])

        let returnedElement = accessibilityStrategy.h(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())

        XCTAssertEqual(returnedElement?.caretLocation, 43)
    }
    
}
