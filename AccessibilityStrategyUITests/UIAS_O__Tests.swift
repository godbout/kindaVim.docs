@testable import kindaVim
import XCTest


class UIAS_O__Tests: UIAS_BaseTests {}


// TextViews
extension UIAS_O__Tests {
    
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
                
        let accessibilityElement = accessibilityStrategy.O(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
        XCTAssertEqual(accessibilityElement?.selectedLength, 18)
        XCTAssertEqual(accessibilityElement?.selectedText, "that's a multiline\n")  
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
        
        let accessibilityElement = accessibilityStrategy.O(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
        XCTAssertEqual(accessibilityElement?.selectedLength, 0)
        // first a linefeed is sent to AXFocusedElement, then nothing in order to reposition 
        // the caret. it's dumb but haven't found a bette way for now. setting the selectedText
        // always moves the caret right after. can't find a way with AX API to add text after the caret without moving it
        XCTAssertEqual(accessibilityElement?.selectedText, "")  
    }
    
    func test_that_if_on_an_empty_line_it_will_still_create_a_line_above() {
        let textInAXFocusedElement = """
there is now

an empty line
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        
        let accessibilityElement = accessibilityStrategy.O(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
        XCTAssertEqual(accessibilityElement?.selectedLength, 12)
        XCTAssertEqual(accessibilityElement?.selectedText, "there is now\n")  
    }
    
    func test_that_if_on_the_last_line_it_creates_a_line_below_and_the_caret_stays_on_the_current_line() {
        let textInAXFocusedElement = """
now the caret
will be on
the last empty line

"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)

        let accessibilityElement = accessibilityStrategy.O(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 45)
        XCTAssertEqual(accessibilityElement?.selectedLength, 0)
        // first a linefeed is sent to AXFocusedElement, then nothing in order to reposition 
        // the caret. it's dumb but haven't found a bette way for now. setting the selectedText
        // always moves the caret right after. can't find a way with AX API to add text after the caret without moving it
        XCTAssertEqual(accessibilityElement?.selectedText, "")  
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
        
        let accessibilityElement = accessibilityStrategy.O(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
        XCTAssertEqual(accessibilityElement?.selectedLength, 11)
        XCTAssertEqual(accessibilityElement?.selectedText, "now there's\n    ")  
    }
    
    func test_that_if_keeps_the_indentation_even_if_it_is_on_the_first_line() {
        let textInAXFocusedElement = """
   now indent on the first line
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [])
        
        let accessibilityElement = accessibilityStrategy.O(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
        XCTAssertEqual(accessibilityElement?.selectedLength, 0)
        XCTAssertEqual(accessibilityElement?.selectedText, "   ")  
    }
    
}
