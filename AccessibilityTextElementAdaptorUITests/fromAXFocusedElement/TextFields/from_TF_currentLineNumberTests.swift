import XCTest

class from_TF_currentLineNumberTests: ATEA_BaseTests {

    func test_that_in_normal_setting_the_line_number_is_correct() {
        let textInAXFocusedElement = "line number should be 1"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [])

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.currentLine.number, 1)
    }

    func test_that_line_number_is_equal_to_1_if_the_caret_is_at_the_beginning_of_the_line() {
        let textInAXFocusedElement = "line number should be 1 also"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.command])

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.currentLine.number, 1)
    }

    func test_that_line_number_is_correct_if_the_caret_is_at_the_end_of_the_line() {
        let textInAXFocusedElement = "line number should be 1 also also"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.currentLine.number, 1)
    }
    
}
