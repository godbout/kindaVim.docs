@testable import kindaVim
import XCTest


class ASNM_A__Tests: ASNM_BaseTests {
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asNormalMode.A(on: element) 
    }
    
}


// The 3 Cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
extension ASNM_A__Tests {
    
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


// TextFields
extension ASNM_A__Tests {

    func test_that_in_normal_setting_it_goes_to_the_last_character_of_a_TextField() {
        let text = "A should go the end of this sentence"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 20,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 36
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 36)
    }
    
}


// TextViews
extension ASNM_A__Tests {

    func test_that_in_normal_setting_it_goes_to_the_end_of_the_line_of_a_TextView() {
        let text = """
A should go to the
end of a line
not of a whole TV
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 25,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 19,
                end: 33
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 32)
    }
    
    func test_that_if_the_caret_is_at_the_end_of_a_line_it_does_not_go_down_one_line() {
        let text = """
if the caret
is at the end of a line
it shouldn't go one line
below
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 36,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 13,
                end: 37
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 36)
    }
    
    func test_that_if_the_caret_is_on_an_empty_line_it_does_not_go_down_one_line() {
        let text = """
if there's an empty

line the caret should
not go down
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 20,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 20,
                end: 21
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 20)        
    }
    
    func test_that_if_the_caret_is_at_the_end_of_the_TextView_it_does_not_move() {
        let text = """
at the end
of a TextView
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 24,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 11,
                end: 24
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 24)
    }
     
}
