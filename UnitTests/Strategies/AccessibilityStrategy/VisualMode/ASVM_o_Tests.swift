@testable import kindaVim
import XCTest


class ASVM_o_Tests: ASVM_BaseTests {
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asVisualMode.o(on: element) 
    }
    
}


// the 3 special cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
extension ASVM_o_Tests {
    
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
        XCTAssertEqual(returnedElement?.selectedLength, 0)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_and_on_an_empty_line_it_does_nothing_and_does_not_crash() {
        let text = """
caret is on its
own emptyfjsl
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


// Both
extension ASVM_o_Tests {
    
    func test_that_it_moves_the_VM_head_to_the_end_of_the_selection_if_it_was_at_the_beginning() {
        let text = "a sentence with a word, or more..."
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 10,
            selectedLength: 5,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 37
            )
        )
        
        AccessibilityStrategyVisualMode.head = 10
        
        _ = applyMove(on: element)
        
        XCTAssertEqual(AccessibilityStrategyVisualMode.head, 14)  
    }
    
    func test_that_it_moves_the_VM_head_to_the_beginning_of_the_selection_if_it_was_at_the_end() {
        let text = """
now we gonna use
some like a little
longer text hehe
tricky
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 19,
            selectedLength: 22,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 17,
                end: 36
            )
        )
        
        AccessibilityStrategyVisualMode.head = 40
        
        _ = applyMove(on: element)
        
        XCTAssertEqual(AccessibilityStrategyVisualMode.head, 19)  
    }
    
    func test_that_it_does_not_move_the_VM_head_if_both_the_beginning_and_the_end_are_the_same() {
        let text = """
another one
my friend
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 15,
            selectedLength: 1,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 12,
                end: 21
            )
        )
        
        AccessibilityStrategyVisualMode.head = 15
        
        _ = applyMove(on: element)
        
        XCTAssertEqual(AccessibilityStrategyVisualMode.head, 15)  
    }
    
}
