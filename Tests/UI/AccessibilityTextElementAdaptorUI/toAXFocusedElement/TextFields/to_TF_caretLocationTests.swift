import XCTest


class to_TF_caretLocationTests: ATEA_BaseTests {

    func test_that_we_can_set_the_caret_location_to_0_on_a_non_empty_line() {
        let text = "hello you dear"
        let element = AccessibilityTextElement(
            value: text,
            length: 14,
            caretLocation: 0,
            selectedLength: 4
        )

        let textInAXFocusedElement = text
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        let conversionSucceeded = AccessibilityTextElementAdaptor.toAXFocusedElement(from: element)
        XCTAssertTrue(conversionSucceeded)

        let reconvertedAccessibilityTextElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        XCTAssertEqual(reconvertedAccessibilityTextElement?.caretLocation, 0)
    }

    func test_that_we_can_set_the_caret_location_wherever_between_the_beginning_and_the_end_of_the_line() {
        let text = "💨️ hello"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 9,
            caretLocation: 4,
            selectedLength: 1,
            selectedText: nil,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 9
            )
        )

        let textInAXFocusedElement = text
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        let conversionSucceeded = AccessibilityTextElementAdaptor.toAXFocusedElement(from: element)
        XCTAssertTrue(conversionSucceeded)

        let reconvertedAccessibilityTextElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        XCTAssertEqual(reconvertedAccessibilityTextElement?.caretLocation, 4)
    }

    func test_that_the_conversion_fails_if_we_set_the_caret_location_out_of_range() {
        let text = "deifnitely not 19"
        let element = AccessibilityTextElement(
            value: text,
            length: 17,
            caretLocation: 19,
            selectedLength: 1
        )

        let textInAXFocusedElement = text
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        let conversionSucceeded = AccessibilityTextElementAdaptor.toAXFocusedElement(from: element)
        XCTAssertFalse(conversionSucceeded)
    }

}
