@testable import kindaVim
import XCTest


class ASNM_C__Tests: ASNM_BaseTests {
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asNormalMode.C(on: element) 
    }
    
}


// The 3 Cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
extension ASNM_C__Tests {
    
    func test_that_if_the_TextElement_is_empty_it_does_not_move() {
        let text = ""
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
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
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_but_not_on_an_empty_line_it_does_not_move() {
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
                number: 2,
                start: 9,
                end: 28
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 28)
        XCTAssertEqual(returnedElement?.selectedLength, 0)
        XCTAssertNil(returnedElement?.selectedText)
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


// TextField
extension ASNM_C__Tests {
    
    func test_that_in_normal_setting_it_deletes_from_the_caret_to_the_end_of_the_line() {
        let text = "C should delete from the caret to the end of the line"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 28,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 53
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 28)
        XCTAssertEqual(returnedElement?.selectedLength, 25)
        XCTAssertEqual(returnedElement?.selectedText, "")
    }
    
}


// TextViews
extension ASNM_C__Tests {
    
    func test_that_in_normal_setting_it_deletes_from_the_caret_to_before_the_linefeed_at_the_end_of_the_line() {
        let text = """
C should delete the second line
but without the linefeed!
else everything gonna stuck
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 40,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 32,
                end: 58
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 40)
        XCTAssertEqual(returnedElement?.selectedLength, 17)
        XCTAssertEqual(returnedElement?.selectedText, "")
    }
    
    func test_that_it_does_not_delete_the_linefeed_even_for_an_empty_line() {
        let text = """
now we have an empty line

and that shouldn't be deleted by C
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 26,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 26,
                end: 27
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 26)
        XCTAssertEqual(returnedElement?.selectedLength, 0)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
}
