import XCTest

class from_TF_currentLineNumberTests: ATEA_BaseTests {

    func test_that_in_normal_setting_the_line_number_is_correct() {
        let textInAXFocusedElement = "line number should be 0"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [])

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.currentLine.number, 0)
    }

    func test_that_line_number_is_equal_to_0_if_the_caret_is_at_the_beginning_of_the_line() {
        let textInAXFocusedElement = "line number should be 0 also"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.command])

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.currentLine.number, 0)
    }

    func test_that_line_number_is_nil_if_the_caret_is_at_the_end_of_the_line() {
        let textInAXFocusedElement = "line number should be 0 also also"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertNil(accessibilityElement?.currentLine.number)
    }
    
}
