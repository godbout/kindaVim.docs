import XCTest

class TV_CaretLocationTests: AEA_BaseTests {}

// from AXUIElement
extension TV_CaretLocationTests {

    func test_that_the_caret_location_is_equal_to_0_if_caret_is_at_the_beginning_of_a_non_empty_TextView() {
        let textInAXFocusedElement = """
        so obviously that's
        a TextView that is not empty
        coz like come on there's so me shits inside.
        """
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [.command])

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.axCaretLocation, 0)
    }

    func test_that_the_caret_location_is_equal_to_0_if_the_TextView_is_empty() {
        let textInAXFocusedElement = ""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.axCaretLocation, 0)
    }

    func test_that_the_caret_location_is_equal_to_text_length_if_caret_is_at_the_end_of_a_TextView() {
        let textInAXFocusedElement = """
        another looooong
        big shit
        for you
        my
        friend...
        """
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.axCaretLocation, textInAXFocusedElement.count)
    }

    func test_that_the_caret_location_is_correct_if_caret_is_between_the_beginning_and_the_end_of_a_TextView() {
        let textInAXFocusedElement = """
        those shits never stop
        i tell you
        it's biiiiiiig and long
        hallelujah
        """
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [.command])
        app.textViews.firstMatch.typeKey(.downArrow, modifierFlags: [])
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [])
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [])


        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.axCaretLocation, 25)
    }

}

// to AXUIElement
// REMINDER:
// axText is for AccessibilityTextElement internal use only
// to search where to position the caret, if we are at the end of text for block cursor, etc.
// this does not set the text of the focused AXUIElement (slow, flickers)
// which is why we need to set it first through the tap and typeText methods
extension TV_CaretLocationTests {

    func test_that_we_can_set_the_caret_location_to_0_on_a_non_empty_TextView() {
        let text = """
        so obviously that's
        a TextView that is not empty
        coz like come on there's so me shits inside.
        """
        let accessibilityElement = AccessibilityTextElement(
            axText: text,
            axCaretLocation: 0
        )

        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(text)

        let conversionSucceeded = AccessibilityTextElementAdaptor.toAXFocusedElememt(from: accessibilityElement)
        XCTAssertTrue(conversionSucceeded)

        let reconvertedAccessibilityTextElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        XCTAssertEqual(reconvertedAccessibilityTextElement?.axCaretLocation, 0)
    }

    func test_that_we_can_set_the_caret_location_to_0_on_an_empty_TextView() {
        let text = ""
        let accessibilityElement = AccessibilityTextElement(
            axText: text,
            axCaretLocation: 0
        )

        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(text)

        let conversionSucceeded = AccessibilityTextElementAdaptor.toAXFocusedElememt(from: accessibilityElement)
        XCTAssertTrue(conversionSucceeded)

        let reconvertedAccessibilityTextElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        XCTAssertEqual(reconvertedAccessibilityTextElement?.axCaretLocation, 0)
    }

    func test_that_we_can_set_the_caret_location_to_the_end_of_the_TextView() {
        let text = """
        another looooong
        big shit
        for you
        my
        friend...
        """
        let accessibilityElement = AccessibilityTextElement(
            axText: text,
            axCaretLocation: 0
        )

        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(text)

        let conversionSucceeded = AccessibilityTextElementAdaptor.toAXFocusedElememt(from: accessibilityElement)
        XCTAssertTrue(conversionSucceeded)

        let reconvertedAccessibilityTextElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        XCTAssertEqual(reconvertedAccessibilityTextElement?.axCaretLocation, 0)
    }

    func test_that_we_can_set_the_caret_location_wherever_between_the_beginning_and_the_end_of_the_TextView() {
        let text = """
        those shits never stop
        i tell you
        it's biiiiiiig and long
        hallelujah
        """
        let accessibilityElement = AccessibilityTextElement(
            axText: text,
            axCaretLocation: 25
        )

        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(text)

        let conversionSucceeded = AccessibilityTextElementAdaptor.toAXFocusedElememt(from: accessibilityElement)
        XCTAssertTrue(conversionSucceeded)

        let reconvertedAccessibilityTextElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        XCTAssertEqual(reconvertedAccessibilityTextElement?.axCaretLocation, 25)
    }

    func test_that_the_conversion_fails_if_we_set_the_caret_location_out_of_range() {
        let text = """
        i'm multiplug
        but still not
        that long.
        """
        let accessibilityElement = AccessibilityTextElement(
            axText: text,
            axCaretLocation: 1993
        )

        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(text)

        let conversionSucceeded = AccessibilityTextElementAdaptor.toAXFocusedElememt(from: accessibilityElement)
        XCTAssertFalse(conversionSucceeded)
    }

}
