@testable import kindaVim
import XCTest


class UIASNM_x_Tests: UIAS_BaseTests {
    
    private func applyMoveAndGetBackAccessibilityElement() -> AccessibilityTextElement? {
        return applyMoveAndGetBackAccessibilityElement { focusedElement in
            asNormalMode.x(on: focusedElement)
        }
    }
    
}


// TextViews
extension UIASNM_x_Tests {
        
    func test_that_if_the_caret_is_at_the_last_character_of_a_line_that_does_not_end_with_a_linefeed_it_deletes_the_last_character_and_goes_back_one_character() {
        let textInAXFocusedElement = """
so we're on the last
character of the last line
that is not an empty line
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [])
        
        let finalElement = applyMoveAndGetBackAccessibilityElement()        
        
        XCTAssertEqual(finalElement?.value, """
so we're on the last
character of the last line
that is not an empty lin
"""
        )
        XCTAssertEqual(finalElement?.caretLocation, 71)
    }
    
    func test_that_if_the_caret_is_on_an_empty_line_it_does_not_delete_the_linefeed() {
        let textInAXFocusedElement = """
next line is gonna be empty!

but shouldn't be deleted
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        
        let finalElement = applyMoveAndGetBackAccessibilityElement()        
        
        XCTAssertEqual(finalElement?.value, """
next line is gonna be empty!

but shouldn't be deleted
"""
        )
        XCTAssertEqual(finalElement?.caretLocation, 29)
    }
    
    func test_that_if_it_deletes_the_last_standing_character_of_a_line_it_does_not_jump_to_the_previous_line() {
        let textInAXFocusedElement = """
shouldn't jump up on this line!
x
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [])
        
        let finalElement = applyMoveAndGetBackAccessibilityElement()        
        
        XCTAssertEqual(finalElement?.value, """
shouldn't jump up on this line!

"""
        )
        XCTAssertEqual(finalElement?.caretLocation, 32)
    }
    
    func test_that_it_should_not_suck_the_next_line() {
        let textInAXFocusedElement = """
a
x
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [.command])
        
        let finalElement = applyMoveAndGetBackAccessibilityElement()        
        
        XCTAssertEqual(finalElement?.value, """

x
"""
        )
        XCTAssertEqual(finalElement?.caretLocation, 0)
    }
    
}
