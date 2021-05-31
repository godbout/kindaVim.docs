import XCTest

class from_TF_caretLocationTests: ATEA_BaseTests {

    func test_that_the_caret_location_is_equal_to_0_if_caret_is_at_the_beginning_of_a_non_empty_line() {
        let textInAXFocusedElement = "check caret location when caret is at beginning of a non empty line"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.command])

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
    }
    
    func test_that_the_caret_location_is_equal_to_0_if_caret_is_on_an_empty_line() {
        let textInAXFocusedElement = ""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
    }
    
    func test_that_the_caret_location_is_equal_to_line_length_if_caret_is_at_the_end_of_a_line() {
        let textInAXFocusedElement = "checking caret location if caret is at end of line"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.caretLocation, textInAXFocusedElement.count)
    }

    func test_that_the_caret_location_is_correct_if_caret_is_between_the_beginning_and_the_end_of_a_line() {
        let textInAXFocusedElement = "checking caret location somewhere along this text"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        for _ in 1...5 {
            app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [])
        }

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.caretLocation, 44)
    }

}

