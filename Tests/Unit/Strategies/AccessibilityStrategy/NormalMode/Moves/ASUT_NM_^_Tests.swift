@testable import kindaVim
import KeyCombination
import XCTest


// the ^ move is using the TextEngine.firstNonBlank function only
// which is already heavily tested. so there are only a few tests here,
// some for redundancy, some that are specific to the ^ move, like
// The 3 Cases, or the fact that it should not stop at the end of
// the line itself like firstNonBlank, but at the end limit
class ASUT_NM_caret_Tests: ASNM_BaseTests {
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asNormalMode.caret(on: element) 
    }
    
}


// Both
extension ASUT_NM_caret_Tests {
    
    func test_that_in_normal_case_it_goes_to_the_first_non_blank_of_the_line() {
        let text = "    hehe ankulay"        
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 16,
            caretLocation: 2,
            selectedLength: 1,
            selectedText: " ",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 16
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 4)     
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
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
            length: 86,
            caretLocation: 71,
            selectedLength: 1,
            selectedText: " ",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 4,
                start: 64,
                end: 86
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 85)  
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
}


// TextViews 
extension ASUT_NM_caret_Tests {
    
    func test_that_for_spaces_and_a_linefeed_it_stops_before_the_linefeed_at_the_correct_end_limit() {
        let text = """
this time the
empty line has a linefeed
                      
 yes
"""        
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 67,
            caretLocation: 44,
            selectedLength: 1,
            selectedText: " ",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 3,
                start: 40,
                end: 63
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 61)   
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
}


// emojis
extension ASUT_NM_caret_Tests {
    
    func test_that_it_handles_emojis() {
        let text = """
need to deal with
    🧕️those 🍃️🍃️🍃️🍃️🍃️🍃️ faces 🥺️☹️😂️
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 64,
            caretLocation: 59,
            selectedLength: 2,
            selectedText: "☹️",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 18,
                end: 64
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 22)
        XCTAssertEqual(returnedElement?.selectedLength, 3)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
}
