@testable import kindaVim
import XCTest


class AS_dT__Tests: AS_BaseTests {
    
    private func applyMove(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return accessibilityStrategy.dT(to: character, on: element) 
    }
    
}


// the 3 special cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
extension AS_dT__Tests {
    
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
        
        let returnedElement = applyMove(to: "a", on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 0)
        XCTAssertEqual(returnedElement?.selectedLength, 0)
        XCTAssertNil(returnedElement?.selectedText)
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
        
        let returnedElement = applyMove(to: "b", on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 28)
        XCTAssertEqual(returnedElement?.selectedLength, 0)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_and_on_an_empty_line_on_its_own_it_does_nothing_and_does_not_crash() {
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
        
        let returnedElement = applyMove(to: "c", on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 31)
        XCTAssertEqual(returnedElement?.selectedLength, 0)
        XCTAssertNil(returnedElement?.selectedText)
    }    
    
}


// Both
extension AS_dT__Tests {
    
    func test_that_in_normal_setting_it_selects_from_after_the_character_found_to_the_caret() {        
        let text = "gonna use dT on that sentence"
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 25,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 29
            )
        )
        
        let returnedElement = applyMove(to: "T", on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 12)
        XCTAssertEqual(returnedElement?.selectedLength, 13)
        XCTAssertEqual(returnedElement?.selectedText, "")
    }
    
    func test_that_if_the_character_is_not_found_then_it_does_nothing() {
        let text = """
gonna look
for a character
that is not there
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 14,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 11,
                end: 27
            )
        )
        
        
        let returnedElement = applyMove(to: "z", on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 14)
        XCTAssertEqual(returnedElement?.selectedLength, 0)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
}


// TextViews
extension AS_dT__Tests {
    
    func test_that_it_can_find_the_character_on_a_line_for_a_multiline() {
        let text = """
dT on a multiline
should work 
on a line
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 28,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 18,
                end: 31
            )
        )
        
        let returnedElement = applyMove(to: "w", on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 26)
        XCTAssertEqual(returnedElement?.selectedLength, 2)
        XCTAssertEqual(returnedElement?.selectedText, "")
    }
    
}
