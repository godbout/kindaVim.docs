import XCTest

class to_TF_AXCaretLocationTests: ATEA_BaseTests {

    func test_that_we_can_set_the_caret_location_to_0_on_a_non_empty_line() {
        let text = "hello you dear"
        let accessibilityElement = AccessibilityTextElement(
            axText: text,
            axCaretLocation: 0
        )

        let textInAXFocusedElement = text
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        let conversionSucceeded = AccessibilityTextElementAdaptor.toAXFocusedElememt(from: accessibilityElement)
        XCTAssertTrue(conversionSucceeded)

        let reconvertedAccessibilityTextElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        XCTAssertEqual(reconvertedAccessibilityTextElement?.axCaretLocation, 0)
    }

    func test_that_we_can_set_the_caret_location_wherever_between_the_beginning_and_the_end_of_the_line() {
        let text = "hello"
        let accessibilityElement = AccessibilityTextElement(
            axText: text,
            axCaretLocation: 4
        )

        let textInAXFocusedElement = text
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        let conversionSucceeded = AccessibilityTextElementAdaptor.toAXFocusedElememt(from: accessibilityElement)
        XCTAssertTrue(conversionSucceeded)

        let reconvertedAccessibilityTextElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        XCTAssertEqual(reconvertedAccessibilityTextElement?.axCaretLocation, 4)
    }

    func test_that_the_conversion_fails_if_we_set_the_caret_location_out_of_range() {
        let text = "deifnitely not 19"
        let accessibilityElement = AccessibilityTextElement(
            axText: text,
            axCaretLocation: 19
        )

        let textInAXFocusedElement = text
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        let conversionSucceeded = AccessibilityTextElementAdaptor.toAXFocusedElememt(from: accessibilityElement)
        XCTAssertFalse(conversionSucceeded)
    }

}
