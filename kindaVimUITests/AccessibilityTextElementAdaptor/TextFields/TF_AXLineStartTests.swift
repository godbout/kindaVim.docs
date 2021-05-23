import XCTest

class TF_AXLineStartTests: ATEA_BaseTests {}

// from AXUIElement
extension TF_AXLineStartTests {
    
    func test_that_the_line_start_is_nil_for_an_empty_TextField() {
        let textInAXFocusedElement = ""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertNil(accessibilityElement?.axLineStart)
    }
    
    func test_that_the_line_start_is_equal_to_0_if_the_caret_is_at_the_beginning_of_a_non_empty_line() {
        let textInAXFocusedElement = "line start is nil if caret at beginning of line"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.command])

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.axLineStart, 0)
    }
    
    func test_that_the_line_start_is_nil_if_the_caret_is_at_the_end_of_the_line() {
        let textInAXFocusedElement = "line start is nil if caret at end of line"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertNil(accessibilityElement?.axLineStart)
    }
    
    func test_that_the_line_start_is_equal_to_0_for_anything_in_between() {
        let textInAXFocusedElement = "line start should always be equal to 0 for TextFields"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [])

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.axLineStart, 0)
    }

}

// to AXUIElement
// are we ever gonna set the line start?
// is that even possible? no idea for now.
extension TF_AXLineStartTests {}
