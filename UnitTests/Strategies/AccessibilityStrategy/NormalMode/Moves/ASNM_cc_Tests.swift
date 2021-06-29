@testable import kindaVim
import XCTest


class ASNM_cc_Tests: ASNM_BaseTests {
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asNormalMode.cc(on: element) 
    }
    
}


// The 3 Cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
extension ASNM_cc_Tests {
    
    func test_that_if_the_TextElement_is_empty_it_does_not_move() {
        let text = ""
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 0,
            caretLocation: 0,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 0
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 0)
        XCTAssertEqual(returnedElement?.selectedLength, 0)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_but_not_on_an_empty_line_it_works_and_deletes_the_line() {
        let text = """
caret is
gonna be at the end
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 28,
            caretLocation: 28,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 9,
                end: 28
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 9)
        XCTAssertEqual(returnedElement?.selectedLength, 19)
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
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 4,
                start: 31,
                end: 31
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 31)
        XCTAssertEqual(returnedElement?.selectedLength, 0)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
}


// Both
extension ASNM_cc_Tests {
    
    func test_that_in_normal_setting_it_deletes_the_whole_line() {
        let text = "this is a single line"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 21,
            caretLocation: 13,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 21
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 0)
        XCTAssertEqual(returnedElement?.selectedLength, 21)
        XCTAssertEqual(returnedElement?.selectedText, "")
    }
    
}


// TextViews
extension ASNM_cc_Tests {
    
    func test_that_in_normal_setting_it_deletes_the_whole_correct_line() {
        let text = """
should delete
the right line
lol
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 32,
            caretLocation: 23,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 14,
                end: 29
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 14)
        XCTAssertEqual(returnedElement?.selectedLength, 14)
        XCTAssertEqual(returnedElement?.selectedText, "")
    }
    
    func test_that_it_should_keep_the_indentation_of_the_current_line() {
        let text = """
   i delete a line
but the indent should
be kept
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 48,
            caretLocation: 10,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 19
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 3)
        XCTAssertEqual(returnedElement?.selectedLength, 15)
        XCTAssertEqual(returnedElement?.selectedText, "")
    }
}
