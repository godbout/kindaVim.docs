import XCTest

class TF_AXCaretLocationTests: ATEA_BaseTests {}

// from AXUIElement
extension TF_AXCaretLocationTests {

    func test_that_the_caret_location_is_equal_to_0_if_caret_is_at_the_beginning_of_a_non_empty_line() {
        let textInAXFocusedElement = "check caret location when caret is at beginning of a non empty line"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.command])

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.axCaretLocation, 0)
    }
    
    func test_that_the_caret_location_is_equal_to_0_if_caret_is_on_an_empty_line() {
        let textInAXFocusedElement = ""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.axCaretLocation, 0)
    }
    
    func test_that_the_caret_location_is_equal_to_line_length_if_caret_is_at_the_end_of_a_line() {
        let textInAXFocusedElement = "checking caret location if caret is at end of line"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.axCaretLocation, textInAXFocusedElement.count)
    }

    func test_that_the_caret_location_is_correct_if_caret_is_between_the_beginning_and_the_end_of_a_line() {
        let textInAXFocusedElement = "checking caret location somewhere along this text"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        for _ in 1...5 {
            app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [])
        }

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.axCaretLocation, 44)
    }

}

// to AXUIElement
// REMINDER:
// internalText is for AccessibilityTextElement internal use only
// to search where to position the caret, if we are at the end of text for block cursor, etc.
// this does not set the text of the focused AXUIElement (slow, flickers)
// which is why we need to set it first through the tap and typeText methods
extension TF_AXCaretLocationTests {

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
    
    func test_that_we_can_set_the_caret_location_to_0_on_an_empty_line() {
        let text = ""
        let accessibilityElement = AccessibilityTextElement(
            axText: "",
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
    
    func test_that_we_can_set_the_caret_location_to_the_end_of_the_line() {
        let text = "hello you dear again again"
        let accessibilityElement = AccessibilityTextElement(
            axText: text,
            axCaretLocation: 26
        )

        let textInAXFocusedElement = text
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        let conversionSucceeded = AccessibilityTextElementAdaptor.toAXFocusedElememt(from: accessibilityElement)
        XCTAssertTrue(conversionSucceeded)

        let reconvertedAccessibilityTextElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        XCTAssertEqual(reconvertedAccessibilityTextElement?.axCaretLocation, 26)
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
