import XCTest

class AccessibilityElementAdaptorTests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false

        app = XCUIApplication()
        app.launch()
    }

}

// from AccessibilityElement to AXUIElement
// REMINDER:
// internalText is for AccessibilityElement internal use only
// to search where to position the caret.
// this does not set the text of the focused AXUIElement (slow, flickers)
// which is why we need to set it first through the tap and typeText methods
extension AccessibilityElementAdaptorTests {

    func test_that_it_can_convert_an_AccessibilityElement_to_an_AXUIElement_text_field() {
        let accessibilityElement = AccessibilityElement(
            internalText: "",
            caretLocation: 3,
            lineStart: 0
        )

        let textInAXFocusedElement = "hello you dear"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        let conversionSucceeded = AccessibilityElementAdaptor.toAXFocusedElememt(from: accessibilityElement)
        XCTAssertTrue(conversionSucceeded)

        let reconvertedAccessibilityElement = AccessibilityElementAdaptor.fromAXFocusedElement()
        XCTAssertEqual(reconvertedAccessibilityElement?.internalText, textInAXFocusedElement)
        XCTAssertEqual(reconvertedAccessibilityElement?.caretLocation, 3)
        XCTAssertEqual(reconvertedAccessibilityElement?.lineStart, 0)
    }

    func test_that_it_can_convert_an_AccessibilityElement_to_an_AXUIElement_text_view() {
        let accessibilityElement = AccessibilityElement(
            internalText: "",
            caretLocation: 1,
            lineStart: 0
        )

        let textInAXFocusedElement = """
        so this is some multiline
            text that i'm trying to
            type and
                see if it works.
        """
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)

        let conversionSucceeded = AccessibilityElementAdaptor.toAXFocusedElememt(from: accessibilityElement)
        XCTAssertTrue(conversionSucceeded)

        let reconvertedAccessibilityElement = AccessibilityElementAdaptor.fromAXFocusedElement()
        XCTAssertEqual(reconvertedAccessibilityElement?.internalText, textInAXFocusedElement)
        XCTAssertEqual(reconvertedAccessibilityElement?.caretLocation, 1)
        XCTAssertEqual(reconvertedAccessibilityElement?.lineStart, 0)
    }

}

