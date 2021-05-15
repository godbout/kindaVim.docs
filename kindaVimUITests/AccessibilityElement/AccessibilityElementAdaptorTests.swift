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
            caretLocation: 3
        )

        let textInAXFocusedElement = "hello you dear"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        let conversionSucceeded = AccessibilityElementAdaptor.toAXFocusedElememt(from: accessibilityElement)
        XCTAssertTrue(conversionSucceeded)

        let reconvertedAccessibilityElement = AccessibilityElementAdaptor.fromAXFocusedElement()
        XCTAssertEqual(reconvertedAccessibilityElement?.internalText, textInAXFocusedElement)
        XCTAssertEqual(reconvertedAccessibilityElement?.caretLocation, 3)
    }

    func test_that_it_can_convert_an_AccessibilityElement_to_an_AXUIElement_text_view() {
        let accessibilityElement = AccessibilityElement(
            internalText: "",
            caretLocation: 1
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
    }

    func test_that_trying_to_convert_an_AccessibilityElement_to_an_AXUIElement_button_returns_false() {
        let accessibilityElement = AccessibilityElement(
            internalText: "hi i'm a button",
            caretLocation: 5
        )

        app.buttons.firstMatch.tap()

        let conversionSucceeded = AccessibilityElementAdaptor.toAXFocusedElememt(from: accessibilityElement)

        XCTAssertFalse(conversionSucceeded)
    }

}

// from AXUIElement to AccessibilityElement
extension AccessibilityElementAdaptorTests {

    func test_that_it_can_convert_an_AXUIElement_text_field_to_an_AccessibilityElement() {
        let textInAXFocusedElement = "some text set in some UIElement"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        for _ in 1...5 {
            app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [])
        }

        let accessibilityElement = AccessibilityElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.internalText, textInAXFocusedElement)
        XCTAssertEqual(accessibilityElement?.caretLocation, textInAXFocusedElement.count - 5)
    }

    func test_that_it_can_convert_an_AXUIElement_text_view_to_an_AccessibilityElement() {
        let textInAXFocusedElement = """
        well that's supposed to be a text view
        so like you can type many lines
          and it's like super cool.
        """
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [])

        let accessibilityElement = AccessibilityElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.internalText, textInAXFocusedElement)
        XCTAssertEqual(accessibilityElement?.caretLocation, textInAXFocusedElement.count - 1)
    }

    func test_that_trying_to_convert_an_AXUIElement_button_to_an_AccessibilityElement_returns_nil() {
        app.buttons.firstMatch.tap()

        let accessibilityElement = AccessibilityElementAdaptor.fromAXFocusedElement()

        XCTAssertNil(accessibilityElement)
    }

}

