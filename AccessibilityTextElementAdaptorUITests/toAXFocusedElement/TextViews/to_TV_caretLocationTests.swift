import XCTest

class to_TV_caretLocationTests: ATEA_BaseTests {

    func test_that_we_can_set_the_caret_location_to_0_on_a_non_empty_TextView() {
        let text = """
so obviously that's
a TextView that is not empty
coz like come on there's so me shits inside.
"""
        let accessibilityElement = AccessibilityTextElement(
            value: text,
            caretLocation: 0
        )

        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(text)

        let conversionSucceeded = AccessibilityTextElementAdaptor.toAXFocusedElememt(from: accessibilityElement)
        XCTAssertTrue(conversionSucceeded)

        let reconvertedAccessibilityTextElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        XCTAssertEqual(reconvertedAccessibilityTextElement?.caretLocation, 0)
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
            value: text,
            caretLocation: 0
        )

        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(text)

        let conversionSucceeded = AccessibilityTextElementAdaptor.toAXFocusedElememt(from: accessibilityElement)
        XCTAssertTrue(conversionSucceeded)

        let reconvertedAccessibilityTextElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        XCTAssertEqual(reconvertedAccessibilityTextElement?.caretLocation, 0)
    }

    func test_that_we_can_set_the_caret_location_wherever_between_the_beginning_and_the_end_of_the_TextView() {
        let text = """
those shits never stop
i tell you
it's biiiiiiig and long
hallelujah
"""
        let accessibilityElement = AccessibilityTextElement(
            value: text,
            caretLocation: 25
        )

        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(text)

        let conversionSucceeded = AccessibilityTextElementAdaptor.toAXFocusedElememt(from: accessibilityElement)
        XCTAssertTrue(conversionSucceeded)

        let reconvertedAccessibilityTextElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        XCTAssertEqual(reconvertedAccessibilityTextElement?.caretLocation, 25)
    }

    func test_that_the_conversion_fails_if_we_set_the_caret_location_out_of_range() {
        let text = """
i'm multiplug
but still not
that long.
"""
        let accessibilityElement = AccessibilityTextElement(
            value: text,
            caretLocation: 1993
        )

        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(text)

        let conversionSucceeded = AccessibilityTextElementAdaptor.toAXFocusedElememt(from: accessibilityElement)
        XCTAssertFalse(conversionSucceeded)
    }

}
