@testable import kindaVim
import XCTest

class AXE_LineNumberTests: AXE_BaseTests {}

// TextFields
extension AXE_LineNumberTests {

    func test_that_in_normal_setting_it_can_get_the_AX_line_number() {
        let textInAXFocusedElement = "that's the text that is in the TextField..."
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        let axLineNumber = AXEngine.axLineNumber(at: 15)

        XCTAssertEqual(axLineNumber, 0)
    }

    func test_that_it_can_get_the_AX_line_number_when_the_caret_is_at_the_beginning_of_a_line() {
        let textInAXFocusedElement = "that's the text that is in the TextField... again..."
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        let axLineNumber = AXEngine.axLineNumber(at: 0)

        XCTAssertEqual(axLineNumber, 0)
    }

    func test_that_it_can_get_the_AX_line_number_when_the_caret_is_at_the_end_of_a_line() {
        let textInAXFocusedElement = "that's the text that is in the TextField... again... and again..."
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        let axLineNumber = AXEngine.axLineNumber(at: textInAXFocusedElement.count)

        XCTAssertEqual(axLineNumber, 0)
    }

}

// TextViews
extension AXE_LineNumberTests {

    func test_that_in_normal_setting_it_can_get_the_AX_line_number_for_TextViews() {
        let textInAXFocusedElement = """
some text to put in the TextView
OMG can you guys speed up the UI Tests
please please please
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)

        let axLineNumber = AXEngine.axLineNumber(at: 47)

        XCTAssertEqual(axLineNumber, 1)
    }

    func test_that_it_can_get_the_AX_line_number_when_the_caret_is_at_the_beginning_of_a_TextView() {
        let textInAXFocusedElement = """
some text to put in the TextView
OMG can you guys speed up the UI Tests
please please please again
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)

        let axLineNumber = AXEngine.axLineNumber(at: 0)

        XCTAssertEqual(axLineNumber, 0)
    }

    func test_that_it_can_get_the_AX_line_number_when_the_caret_is_at_the_end_of_a_TextView() {
        let textInAXFocusedElement = """
some text to put in the TextView
OMG can you guys speed up the UI Tests
please please please again again again
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)

        let axLineNumber = AXEngine.axLineNumber(at: textInAXFocusedElement.count)

        XCTAssertEqual(axLineNumber, 2)
    }

    func test_that_it_can_get_the_correct_AX_line_number_when_the_caret_is_at_the_beginning_of_a_line() {
        let textInAXFocusedElement = """
some text to put in the TextView
OMG can you guys speed up the UI Tests
please please please again again again
that starts to be quite a lot
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)

        let axLineNumber = AXEngine.axLineNumber(at: 33)

        XCTAssertEqual(axLineNumber, 1)
    }

    func test_that_it_can_get_the_correct_AX_line_number_when_the_caret_is_at_the_end_of_a_line() {
        let textInAXFocusedElement = """
some text to put in the TextView
OMG can you guys speed up the UI Tests
please please please again again again
fucking hell
that's big
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)

        let axLineNumber = AXEngine.axLineNumber(at: 71)

        XCTAssertEqual(axLineNumber, 1)
    }

}
