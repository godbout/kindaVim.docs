@testable import kindaVim
import XCTest


class UIASNM_O__Tests: UIAS_BaseTests {
    
    private func applyMoveAndGetBackAccessibilityElement() -> AccessibilityTextElement? {
        return applyMoveAndGetBackAccessibilityElement { focusedElement in
            asNormalMode.O(on: focusedElement)
        }
    }
    
}


// TextViews
extension UIASNM_O__Tests {
    
    func test_that_in_normal_setting_it_creates_a_new_line_above_the_current_one() {
        let textInAXFocusedElement = """
that's a multiline
and O will
create a new line
above!
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
                
        let finalElement = applyMoveAndGetBackAccessibilityElement()        
        
        XCTAssertEqual(finalElement?.value, """
that's a multiline

and O will
create a new line
above!
"""
        )
        XCTAssertEqual(finalElement?.caretLocation, 19)
    }
    
    func test_that_if_at_the_first_line_it_will_create_a_new_line_above() {
        let textInAXFocusedElement = """
caret on the first
line and it should
still create a line above
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        
        let finalElement = applyMoveAndGetBackAccessibilityElement()        
        
        XCTAssertEqual(finalElement?.value, """

caret on the first
line and it should
still create a line above
"""
        )
        XCTAssertEqual(finalElement?.caretLocation, 0)
    }
    
    func test_that_if_on_an_empty_line_it_will_still_create_a_line_above() {
        let textInAXFocusedElement = """
there is now

an empty line
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        
        let finalElement = applyMoveAndGetBackAccessibilityElement()        
        
        XCTAssertEqual(finalElement?.value, """
there is now


an empty line
"""
        )
        XCTAssertEqual(finalElement?.caretLocation, 13)
    }
    
    func test_that_if_on_the_last_empty_line_it_creates_a_line_below_and_the_caret_stays_on_the_current_line() {
        let textInAXFocusedElement = """
now the caret
will be on
the last empty line

"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)

        let finalElement = applyMoveAndGetBackAccessibilityElement()        
        
        XCTAssertEqual(finalElement?.value, """
now the caret
will be on
the last empty line


"""
        )
        XCTAssertEqual(finalElement?.caretLocation, 45)
    }
    
    func test_that_if_on_the_last_non_empty_line_it_creates_a_line_below_and_the_caret_stays_on_the_current_line() {
        let textInAXFocusedElement = """
now the caret
will be on
the last empty line
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [])
        
        let finalElement = applyMoveAndGetBackAccessibilityElement()        
        
        XCTAssertEqual(finalElement?.value, """
now the caret
will be on

the last empty line
"""
        )
        XCTAssertEqual(finalElement?.caretLocation, 25)
    }
    
    func test_that_it_creates_a_line_above_and_goes_to_the_same_indentation_as_the_current_line() {
        let textInAXFocusedElement = """
now there's
    some indent
but it should work
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        
        let finalElement = applyMoveAndGetBackAccessibilityElement()        
        
        XCTAssertEqual(finalElement?.value, """
now there's
    
    some indent
but it should work
"""
        )
        XCTAssertEqual(finalElement?.caretLocation, 16)
    }
    
    func test_that_if_keeps_the_indentation_even_if_it_is_on_the_first_line() {
        let textInAXFocusedElement = """
   now indent on the first line
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [])
        
        let finalElement = applyMoveAndGetBackAccessibilityElement()        
        
        XCTAssertEqual(finalElement?.value, """
   
   now indent on the first line
"""
        )
        XCTAssertEqual(finalElement?.caretLocation, 3)
    }
    
}
