@testable import kindaVim
import XCTest


// the ^ move is using the TextEngine.firstNonBlank function only
// which is already heavily tested. so there are only a few tests here,
// some for redundancy, some that are specific to the ^ move, like
// The 3 Cases, or the fact that it should not stop at the end of
// the line itself like firstNonBlank, but at the end limit
class ASNM_caret_Tests: ASNM_BaseTests {
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asNormalMode.caret(on: element) 
    }
    
}


// the 3 special cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
extension ASNM_caret_Tests {
    
    func test_that_if_the_TextElement_is_empty_it_does_nothing_and_does_not_crash() {
        let text = ""
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 0,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: nil,
                start: nil,
                end: nil
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 0)
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_but_not_on_an_empty_line_it_does_nothing_and_does_not_crash() {
        let text = """
caret is
gonna be at the end
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 28,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: nil,
                start: nil,
                end: nil
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 28)        
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_and_on_an_empty_line_it_does_nothing_and_does_not_crash() {
        let text = """
caret is on its
own empty
line

"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 31,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: nil,
                start: nil,
                end: nil
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 31)
    }    
    
}


// Both
extension ASNM_caret_Tests {
    
    func test_that_in_normal_case_it_goes_to_the_first_non_blank_of_the_line() {
        let text = "    hehe ankulay"
        
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 2,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 16
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 4)        
    }
    
    func test_that_if_the_text_is_just_spaces_and_no_linefeed_then_the_caret_goes_at_the_end_of_the_text() {
        let text = """
a multiline
with a last line
without a linefeed but with spaces
                      
"""
        
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 71,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 3,
                start: 64,
                end: 86
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 85)    
    }
    
}


// TextViews 
extension ASNM_caret_Tests {
    
    func test_that_for_spaces_and_a_linefeed_it_stops_before_the_linefeed_at_the_correct_end_limit() {
        let text = """
this time the
empty line has a linefeed
                      
 yes
"""
        
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 44,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 40,
                end: 63
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 61)   
    }
    
}
