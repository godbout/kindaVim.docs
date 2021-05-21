@testable import kindaVim
import XCTest

class AXE_LineRangeForLineNumber_Tests: AXE_BaseTests {}

// TextFields
extension AXE_LineRangeForLineNumber_Tests {

    func test_that_in_normal_setting_it_can_get_the_correct_AX_line_range_for_a_TextField() {
        let textInAXFocusedElement = "we gonna try to get the line range here hehe"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        guard let axLineNumber = AXEngine.axLineNumberFor(location: 4) else { return XCTFail() }

        let axLineRange = AXEngine.axLineRangeFor(lineNumber: axLineNumber)

        XCTAssertEqual(axLineRange?.location, 0)
        XCTAssertEqual(axLineRange?.length, textInAXFocusedElement.count)
    }

    func test_that_it_can_get_the_correct_AX_line_range_when_the_caret_is_at_the_beginning_of_a_TextField() {
        let textInAXFocusedElement = "we gonna try to get the line range here hehe again"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        guard let axLineNumber = AXEngine.axLineNumberFor(location: 0) else { return XCTFail() }

        let axLineRange = AXEngine.axLineRangeFor(lineNumber: axLineNumber)

        XCTAssertEqual(axLineRange?.location, 0)
        XCTAssertEqual(axLineRange?.length, textInAXFocusedElement.count)
    }

}

// TextViews
extension AXE_LineNumberTests {

    func test_that_in_normal_setting_it_can_get_the_correct_AX_line_range_for_a_TextView() {
        let textInAXFocusedElement = """
the usual long text view
to make sure that
people can Vim while arguing
on forums.
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)

        guard let axLineNumber = AXEngine.axLineNumberFor(location: 33) else { return XCTFail() }

        let axLineRange = AXEngine.axLineRangeFor(lineNumber: axLineNumber)

        XCTAssertEqual(axLineRange?.location, 25)
        XCTAssertEqual(axLineRange?.length, 18)
    }

    func test_that_it_can_get_the_correct_AX_line_range_when_the_caret_is_at_the_beginning_of_a_TextView() {
        let textInAXFocusedElement = """
the usual long text view
to make sure that
people can Vim while arguing
on forums LMAO
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)

        guard let axLineNumber = AXEngine.axLineNumberFor(location: 0) else { return XCTFail() }

        let axLineRange = AXEngine.axLineRangeFor(lineNumber: axLineNumber)

        XCTAssertEqual(axLineRange?.location, 0)
        XCTAssertEqual(axLineRange?.length, 25)
    }

    func test_that_it_can_get_the_correct_AX_line_range_when_the_caret_is_at_the_beginning_of_a_line() {
        let textInAXFocusedElement = """
the usual long text view
people can Vim while arguing
getting boring to be honest
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)

        guard let axLineNumber = AXEngine.axLineNumberFor(location: 25) else { return XCTFail() }

        let axLineRange = AXEngine.axLineRangeFor(lineNumber: axLineNumber)

        XCTAssertEqual(axLineRange?.location, 25)
        XCTAssertEqual(axLineRange?.length, 29)
    }

    func test_that_it_can_get_the_correct_AX_line_range_when_the_caret_is_at_the_end_of_a_line() {
        let textInAXFocusedElement = """
the usual long text view
people can Vim while arguing
getting boring to be honest
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)

        guard let axLineNumber = AXEngine.axLineNumberFor(location: 53) else { return XCTFail() }

        let axLineRange = AXEngine.axLineRangeFor(lineNumber: axLineNumber)

        XCTAssertEqual(axLineRange?.location, 25)
        XCTAssertEqual(axLineRange?.length, 29)
    }

}
