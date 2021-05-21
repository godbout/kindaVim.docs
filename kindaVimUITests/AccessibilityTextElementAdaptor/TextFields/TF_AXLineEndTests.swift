import XCTest

class TF_LineEndTests: AEA_BaseTests {}

// from AXUIElement
extension TF_LineStartTests {

    func test_that_the_line_end_is_equal_to_0_for_an_empty_line() {
        let textInAXFocusedElement = ""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.axLineEnd, 0)
    }

    func test_that_the_line_end_is_equal_to_line_length_for_TextFields() {
        let textInAXFocusedElement = "line end should always be equal to line length for TextFields"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.axLineEnd, textInAXFocusedElement.count)
    }

}

// to AXUIElement
// are we ever gonna set the line start?
// is that even possible? no idea for now.
extension TF_LineEndTests {}
