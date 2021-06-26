@testable import kindaVim
import XCTest


class ASVM_V_Tests: ASVM_BaseTests {
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asVisualMode.V(on: element) 
    }
    
}


// the 3 special cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
extension ASVM_V_Tests {
    
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
        XCTAssertEqual(returnedElement?.selectedLength, 0)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
    // for V this case requires UI testing as we have to call lineFor in order to get the line info of the caretLocation - 1
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_but_not_on_an_empty_line_it_selects_the_whole_line() {}
    
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
        XCTAssertEqual(returnedElement?.selectedLength, 0)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
}


// TextFields
extension ASVM_V_Tests {
    
    func test_that_it_selects_the_whole_line_even_if_it_does_not_end_with_a_linefeed() {
        let text = "a sentence without a linefeed"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 17,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 29
            )
        )
        
        VimEngine.shared.visualStyle = .characterwise
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 0)
        XCTAssertEqual(returnedElement?.selectedLength, 29)  
    }
    
    func test_that_it_selects_the_whole_line_even_if_it_does_end_with_a_linefeed() {
        let text = """
now that's one with
a linefeed at the end
!
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 27,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 20,
                end: 42
            )
        )
        
        VimEngine.shared.visualStyle = .characterwise
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 20)
        XCTAssertEqual(returnedElement?.selectedLength, 22)  
    }
    
}
