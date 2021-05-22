@testable import kindaVim
import XCTest

class AXE_LineNumberTests: AXE_BaseTests {}

// Both
extension AXE_LineNumberTests {
    
    func test_that_it_cannot_get_the_AX_line_number_for_an_empty_AXUIElement() {
        let textInAXFocusedElement = ""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        let axLineNumber = AXEngine.axLineNumberFor(location: textInAXFocusedElement.count)

        XCTAssertNil(axLineNumber)
    }
    
    func test_that_it_cannot_get_the_AX_line_number_for_an_out_of_bound_location() {
        let textInAXFocusedElement = "a very small one"
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)

        let axLineNumber = AXEngine.axLineNumberFor(location: 1000)

        XCTAssertNil(axLineNumber)
    }
    
}

// TextFields
extension AXE_LineNumberTests {

    func test_that_in_normal_setting_it_can_get_the_AX_line_number() {
        let textInAXFocusedElement = "getting ax line number with caret in between"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        let axLineNumber = AXEngine.axLineNumberFor(location: 15)

        XCTAssertEqual(axLineNumber, 0)
    }

    func test_that_it_can_get_the_AX_line_number_when_the_caret_is_at_the_beginning_of_a_line() {
        let textInAXFocusedElement = "getting ax line number with caret at beginning"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        let axLineNumber = AXEngine.axLineNumberFor(location: 0)

        XCTAssertEqual(axLineNumber, 0)
    }
    
    func test_that_it_cannot_get_the_AX_line_number_when_the_caret_is_at_the_end_of_a_line() {
        let textInAXFocusedElement = "getting ax line number with caret at end"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        let axLineNumber = AXEngine.axLineNumberFor(location: textInAXFocusedElement.count)

        XCTAssertNil(axLineNumber)
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

        let axLineNumber = AXEngine.axLineNumberFor(location: 47)

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

        let axLineNumber = AXEngine.axLineNumberFor(location: 0)

        XCTAssertEqual(axLineNumber, 0)
    }
    
    func test_that_it_cannot_get_the_correct_AX_line_number_when_the_caret_is_at_the_end_of_a_TextView() {
        let textInAXFocusedElement = """
some text to put in the TextView
OMG can you guys speed up the UI Tests
please please please again again again
fucking hell
that's big bis
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)

        let axLineNumber = AXEngine.axLineNumberFor(location: textInAXFocusedElement.count)

        XCTAssertNil(axLineNumber)
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

        let axLineNumber = AXEngine.axLineNumberFor(location: 33)

        // Big Sur bugs here if the first character is selected
        // it returns the previous line rather than the current :CRY:
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

        let axLineNumber = AXEngine.axLineNumberFor(location: 71)

        XCTAssertEqual(axLineNumber, 1)
    }
    
}
