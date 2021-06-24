@testable import kindaVim
import XCTest


class ASNM_gg_Tests: ASNM_BaseTests {
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return accessibilityStrategy.gg(on: element) 
    }
    
}


// the 3 special cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
extension ASNM_gg_Tests {
    
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
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_and_on_an_empty_line_it_works_and_the_caret_goes_to_the_relevant_position() {
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
        
        XCTAssertEqual(returnedElement?.caretLocation, 0)
    }    
    
}


// TextFields
extension ASNM_gg_Tests {

    func test_that_it_goes_to_the_beginning_of_the_line_if_it_starts_with_non_blank() {
        let text = "a normal sentence"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 14,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 17
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 0)
    }

    func test_that_it_goes_to_the_first_non_blank_of_the_line() {
        let text = "      gg should go to g"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 20,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 23
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
extension ASNM_gg_Tests {
    
    func test_that_it_goes_to_the_first_character_of_the_TextView_if_it_starts_with_non_blank() {
        let text = """
a beautiful poem
right
here
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 25,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 23,
                end: 27
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 0)
    }
    
    func test_that_it_goes_to_the_first_non_blank_of_the_TextView() {
        let text = """
   a couple of spaces
then a lot
of
bullshit
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 40,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 3,
                start: 36,
                end: 44
            )
        )
                
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 3)
    }
    
    func test_that_it_works_with_an_empty_first_line() {
        let text = """

first line is
completely empty
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 9,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 1,
                end: 15
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 0)
    }
    
    func test_that_it_stops_at_the_end_limit_when_the_first_line_is_just_spaces() {
        let text = """
        
lol lots of spaces
again only
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 34,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 28,
                end: 38
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 7)
    }
    
}
