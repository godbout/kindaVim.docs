import XCTest

class TF_LineStartTests: AEA_BaseTests {}

// from AXUIElement to AccessibilityTextElement
extension TF_LineStartTests {

    func test_that_the_line_start_is_equal_to_0_for_TextFields() {
        let textInAXFocusedElement = "line start should always be equal to 0 for TextFields"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.lineStart, 0)
    }

    func test_that_the_line_start_is_equal_to_0_for_an_empty_line() {
        let textInAXFocusedElement = ""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.lineStart, 0)
    }

    func test_that_the_line_start_is_equal_to_0_even_if_caret_is_at_the_end_of_a_line() {
        let textInAXFocusedElement = "line start should be 0 even if caret is at the end of the text"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.lineStart, 0)
    }

    func test_that_the_line_start_is_equal_to_0_if_caret_is_between_the_beginning_and_the_end_of_a_line() {
        let textInAXFocusedElement = "line start should be 0 whatever the caret position in a TextField"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        for _ in 1...3 {
            app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [])
        }

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.lineStart, 0)
    }

}

// from AccessibilityTextElement to AXUIElement
// are we ever gonna set the line start?
// is that even possible? no idea for now.
extension TF_LineStartTests {}
