import XCTest

class CaretLocationTests: AEA_BaseTests {}

// TextFields
extension CaretLocationTests {

    func test_that_the_caret_location_is_equal_to_0_if_caret_is_at_the_beginning_of_a_non_empty_line() {
        let textInAXFocusedElement = "some text set in some UIElement"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.command])

        let accessibilityElement = AccessibilityElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
    }

    func test_that_the_caret_location_is_equal_to_0_if_caret_is_on_an_empty_line() {
        let textInAXFocusedElement = ""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        let accessibilityElement = AccessibilityElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
    }



}

// TextViews
extension CaretLocationTests {

}
