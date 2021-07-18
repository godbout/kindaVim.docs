@testable import kindaVim
import XCTest


// r is one of those moves (like o) where we need to move the caret position
// after the move is executed (because we set the selectedText). so for those cases,
// we need to test through UI Tests. the tests below are the tests we can do
// before the caret is moved back.
class ASNM_r_Tests: ASNM_BaseTests {
    
    private func applyMove(with replacement: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asNormalMode.r(with: replacement, on: element) 
    }
    
}


// The 3 Cases:
// - empty TextElement
// - 2nd case is now gone!
// - caret at the end of TextElement on own empty line
extension ASNM_r_Tests {
    
    func test_that_if_the_TextElement_is_empty_it_does_not_move() {
        let text = ""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 0,
            caretLocation: 0,
            selectedLength: 0,
            selectedText: "",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 0
            )
        )
        
        let returnedElement = applyMove(with: "x", on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 0)
        XCTAssertEqual(returnedElement?.selectedLength, 0)
        XCTAssertEqual(returnedElement?.selectedText, "")
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_and_on_an_empty_line_on_its_own_it_does_not_move() {
        let text = """
caret is on its
own empty
line

"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 31,
            caretLocation: 31,
            selectedLength: 0,
            selectedText: "",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 4,
                start: 31,
                end: 31
            )
        )
        
        let returnedElement = applyMove(with: "x", on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 31)
        XCTAssertEqual(returnedElement?.selectedLength, 0)
        XCTAssertEqual(returnedElement?.selectedText, "")
    }
    
}


// Both
extension ASNM_r_Tests {
    
    func test_that_in_normal_setting_it_replaces_the_character_under_the_cursor_with_the_one_given() {
        let text = "gonna replace one of those letters..."
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 37,
            caretLocation: 23,
            selectedLength: 1,
            selectedText: "o",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 37
            )
        )
        
        let returnedElement = applyMove(with: "e", on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 23)
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertEqual(returnedElement?.selectedText, "e")        
    }
    
    func test_that_it_can_replace_a_letter_by_a_space() {
        let text = "i need more space!"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 18,
            caretLocation: 12,
            selectedLength: 1,
            selectedText: "s",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 18
            )
        )
        
        let returnedElement = applyMove(with: " ", on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 12)
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertEqual(returnedElement?.selectedText, " ")
    }
    
    func test_that_if_the_replacement_is_escape_then_it_does_nothing() {
        let text = "trying to replace by an escape does shit!"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 41,
            caretLocation: 15,
            selectedLength: 1,
            selectedText: "c",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 41
            )
        )
        
        let returnedElement = applyMove(with: "\u{1b}", on: element)
        
        XCTAssertNil(returnedElement?.selectedText)
    }
    
}


// TextViews
extension ASNM_r_Tests {
    
    func test_that_if_the_caret_is_on_a_linefeed_it_does_not_replace_it() {
        let text = """
can't change a

linefeed
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 24,
            caretLocation: 15,
            selectedLength: 1,
            selectedText: "\n",
            currentLine: AccessibilityTextElementLine(
            fullValue: text,
            number: 2,
            start: 15,
            end: 16
            )
            )
        
        let returnedElement = applyMove(with: "g", on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 15)
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }
            
}
