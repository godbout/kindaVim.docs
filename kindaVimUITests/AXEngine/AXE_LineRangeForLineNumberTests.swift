@testable import kindaVim
import XCTest

class AXE_LineRangeForLineNumber_Tests: AXE_BaseTests {}

// Both
extension AXE_LineRangeForLineNumber_Tests {
    
    func test_that_it_cannot_get_the_correct_AX_line_range_for_an_empty_field() {
        let textInAXFocusedElement = ""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        
        let axLineRange = AXEngine.axLineRangeFor(lineNumber: 0)
        
        XCTAssertNil(axLineRange)
    }
    
    func test_that_it_cannot_get_the_correct_AX_line_range_for_an_out_of_bound_line_number() {
        let textInAXFocusedElement = ""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        
        let axLineRange = AXEngine.axLineRangeFor(lineNumber: 69)
        
        XCTAssertNil(axLineRange)
    }

}

// TextFields
extension AXE_LineRangeForLineNumber_Tests {

    func test_that_in_normal_setting_it_can_get_the_correct_AX_line_range_for_a_TextField() {
        let textInAXFocusedElement = "we gonna try to get the line range here hehe"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        let axLineRange = AXEngine.axLineRangeFor(lineNumber: 0)

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

        let axLineRange = AXEngine.axLineRangeFor(lineNumber: 1)

        XCTAssertEqual(axLineRange?.location, 25)
        XCTAssertEqual(axLineRange?.length, 18)
    }
    
    func test_that_it_can_get_the_correct_AX_line_range_for_the_first_line_of_a_TextView() {
        let textInAXFocusedElement = """
gonna try
to get the ax line range
of the first line
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)

        let axLineRange = AXEngine.axLineRangeFor(lineNumber: 0)

        XCTAssertEqual(axLineRange?.location, 0)
        XCTAssertEqual(axLineRange?.length, 10)
    }
    
    func test_that_it_can_get_the_correct_AX_line_range_for_the_last_line_of_a_TextView() {
        let textInAXFocusedElement = """
gonna try to fucking
get the ax line range
of the last line
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)

        let axLineRange = AXEngine.axLineRangeFor(lineNumber: 2)

        XCTAssertEqual(axLineRange?.location, 43)
        XCTAssertEqual(axLineRange?.length, 16)
    }

}
