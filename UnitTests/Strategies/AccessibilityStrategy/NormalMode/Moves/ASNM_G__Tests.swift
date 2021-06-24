@testable import kindaVim
import XCTest


class ASNM_G__Tests: ASNM_BaseTests {
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return accessibilityStrategy.G(on: element) 
    }
    
}


// the 3 special cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
extension ASNM_G__Tests {
    
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


// TextFields
extension ASNM_G__Tests {
    
    func test_that_it_goes_to_the_beginning_of_the_line_if_it_starts_with_non_blank() {
        let text = "a normal sentence for G"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 12,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 23
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 0)
    }
    
    func test_that_it_goes_to_the_first_non_blank_of_the_line() {
        let text = "      G should go to well G"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 19,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 27
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 6)
    }
    
    func test_that_it_goes_to_the_end_limit_of_the_line_if_there_is_no_non_blank() {
        let text = "         "
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 4,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 9
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 8)
    }
    
}


// TextViews 
extension ASNM_G__Tests {
    
    func test_that_it_goes_to_the_first_character_of_the_last_line_of_the_TextView_if_that_line_starts_with_non_blank() {
        let text = """
hehehe
do you want to
have xxx
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 3,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 7
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 22)
    }
    
    func test_that_it_goes_to_the_first_non_blank_of_the_last_line_of_the_TextView() {
        let text = """
 that's another
story bro
   and it's not easy
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 23,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 16,
                end: 26
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 29)
    }
    
    func test_that_it_works_with_an_empty_last_line() {
        let text = """
last line is
completely empty

"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 22,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 13,
                end: 30
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 30)
    }
    
    func test_that_it_stops_at_the_end_limit_when_the_last_line_is_just_spaces() {
        let text = """
fucking loads of spaces
again at the last line
             
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 19,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 24
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 59)
    }
    
}
