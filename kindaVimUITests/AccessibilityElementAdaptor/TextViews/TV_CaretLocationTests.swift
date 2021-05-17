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

        let accessibilityElement = AccessibilityElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
    }

    func test_that_the_caret_location_is_equal_to_0_if_the_TextView_is_empty() {
        let textInAXFocusedElement = ""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)

        let accessibilityElement = AccessibilityElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
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

        let accessibilityElement = AccessibilityElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.caretLocation, textInAXFocusedElement.count)
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


        let accessibilityElement = AccessibilityElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.caretLocation, 25)
    }

}

// to AXUIElement
extension TV_CaretLocationTests {

    func test_that_we_can_set_the_caret_location_to_0_on_a_non_empty_TextView() {
        let accessibilityElement = AccessibilityElement(caretLocation: 0)

        let textInAXFocusedElement = """
        so obviously that's
        a TextView that is not empty
        coz like come on there's so me shits inside.
        """
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)

        let conversionSucceeded = AccessibilityElementAdaptor.toAXFocusedElememt(from: accessibilityElement)
        XCTAssertTrue(conversionSucceeded)

        let reconvertedAccessibilityElement = AccessibilityElementAdaptor.fromAXFocusedElement()
        XCTAssertEqual(reconvertedAccessibilityElement?.caretLocation, 0)
    }

    func test_that_we_can_set_the_caret_location_to_0_on_an_empty_TextView() {
        let accessibilityElement = AccessibilityElement(caretLocation: 0)

        let textInAXFocusedElement = ""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)

        let conversionSucceeded = AccessibilityElementAdaptor.toAXFocusedElememt(from: accessibilityElement)
        XCTAssertTrue(conversionSucceeded)

        let reconvertedAccessibilityElement = AccessibilityElementAdaptor.fromAXFocusedElement()
        XCTAssertEqual(reconvertedAccessibilityElement?.caretLocation, 0)
    }

    func test_that_we_can_set_the_caret_location_to_the_end_of_the_TextView() {
        let accessibilityElement = AccessibilityElement(caretLocation: 0)

        let textInAXFocusedElement = """
        another looooong
        big shit
        for you
        my
        friend...
        """
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)

        let conversionSucceeded = AccessibilityElementAdaptor.toAXFocusedElememt(from: accessibilityElement)
        XCTAssertTrue(conversionSucceeded)

        let reconvertedAccessibilityElement = AccessibilityElementAdaptor.fromAXFocusedElement()
        XCTAssertEqual(reconvertedAccessibilityElement?.caretLocation, 0)
    }

    func test_that_we_can_set_the_caret_location_wherever_between_the_beginning_and_the_end_of_the_TextView() {
        let accessibilityElement = AccessibilityElement(caretLocation: 25)

        let textInAXFocusedElement = """
        those shits never stop
        i tell you
        it's biiiiiiig and long
        hallelujah
        """
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)

        let conversionSucceeded = AccessibilityElementAdaptor.toAXFocusedElememt(from: accessibilityElement)
        XCTAssertTrue(conversionSucceeded)

        let reconvertedAccessibilityElement = AccessibilityElementAdaptor.fromAXFocusedElement()
        XCTAssertEqual(reconvertedAccessibilityElement?.caretLocation, 25)
    }

    func test_that_the_conversion_fails_if_we_set_the_caret_location_out_of_range() {
        let accessibilityElement = AccessibilityElement(caretLocation: 1993)

        let textInAXFocusedElement = """
        i'm multiplug
        but still not
        that long.
        """
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)

        let conversionSucceeded = AccessibilityElementAdaptor.toAXFocusedElememt(from: accessibilityElement)
        XCTAssertFalse(conversionSucceeded)
    }

}
