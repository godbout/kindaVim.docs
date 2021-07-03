import XCTest

class to_TF_caretLocationTests: ATEA_BaseTests {

    func test_that_we_can_set_the_caret_location_to_0_on_a_non_empty_line() {
        let text = "hello you dear"
        let accessibilityElement = AccessibilityTextElement(
            value: text,
            length: 14,
            caretLocation: 0,
            selectedLength: 1
        )

        let textInAXFocusedElement = text
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        let conversionSucceeded = AccessibilityTextElementAdaptor.toAXFocusedElement(from: accessibilityElement)
        XCTAssertTrue(conversionSucceeded)

        let reconvertedAccessibilityTextElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        XCTAssertEqual(reconvertedAccessibilityTextElement?.caretLocation, 0)
    }

    func test_that_we_can_set_the_caret_location_wherever_between_the_beginning_and_the_end_of_the_line() {
        let text = "hello"
        let accessibilityElement = AccessibilityTextElement(
            value: text,
            length: 5,
            caretLocation: 4,
            selectedLength: 1
        )

        let textInAXFocusedElement = text
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        let conversionSucceeded = AccessibilityTextElementAdaptor.toAXFocusedElement(from: accessibilityElement)
        XCTAssertTrue(conversionSucceeded)

        let reconvertedAccessibilityTextElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        XCTAssertEqual(reconvertedAccessibilityTextElement?.caretLocation, 4)
    }

    func test_that_the_conversion_fails_if_we_set_the_caret_location_out_of_range() {
        let text = "deifnitely not 19"
        let accessibilityElement = AccessibilityTextElement(
            value: text,
            length: 17,
            caretLocation: 19,
            selectedLength: 1
        )

        let textInAXFocusedElement = text
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        let conversionSucceeded = AccessibilityTextElementAdaptor.toAXFocusedElement(from: accessibilityElement)
        XCTAssertFalse(conversionSucceeded)
    }

}
