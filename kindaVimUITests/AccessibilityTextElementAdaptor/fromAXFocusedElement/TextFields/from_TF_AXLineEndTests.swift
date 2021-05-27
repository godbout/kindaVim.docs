import XCTest

class from_TF_AXLineEndTests: ATEA_BaseTests {

    func test_that_the_line_end_is_nil_for_an_empty_TextField() {
        let textInAXFocusedElement = ""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertNil(accessibilityElement?.currentLine.end)
    }
    
    func test_that_the_line_end_is_equal_to_line_length_if_the_caret_is_at_the_beginning_of_the_line() {
        let textInAXFocusedElement = "line end is nil if caret at beginning of line"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.command])

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.currentLine.end, textInAXFocusedElement.count)
    }
    
    func test_that_the_line_end_is_nil_if_the_caret_is_at_the_end_of_the_line() {
        let textInAXFocusedElement = "line end is nil if caret at end of line"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertNil(accessibilityElement?.currentLine.end)
    }
    
    func test_that_the_line_end_is_equal_to_line_length_for_anything_in_between() {
        let textInAXFocusedElement = "line end should always be equal to 0 for TextFields"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [])

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.currentLine.end, textInAXFocusedElement.count)
    }

}
