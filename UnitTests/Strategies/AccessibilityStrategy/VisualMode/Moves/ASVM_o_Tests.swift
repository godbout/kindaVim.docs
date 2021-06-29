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
    
    func test_that_if_the_TextElement_is_empty_it_works_and_changes_nothing() {
        let text = ""
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 0,
            caretLocation: 0,
            selectedLength: 0,
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
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_but_not_on_an_empty_line_it_does_nothing() {
        let text = """
caret is
gonna be at the end
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 28,
            caretLocation: 28,
            selectedLength: 0,
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
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_and_on_an_empty_line_it_does_nothing() {
        let text = """
caret is on its
own emptyfjsl
line

"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 35,
            caretLocation: 35,
            selectedLength: 0,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 4,
                start: 35,
                end: 35
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 35)
        XCTAssertEqual(returnedElement?.selectedLength, 0)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
}


// Both
extension ASVM_o_Tests {
    
    func test_that_if_the_anchor_is_the_caret_location_and_the_head_is_the_end_of_the_selection_then_it_switches_them() {
        let text = "a sentence with a word, or more..."
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 34,
            caretLocation: 10,
            selectedLength: 1,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 34
            )
        )
        
        AccessibilityStrategyVisualMode.anchor = 10
        AccessibilityStrategyVisualMode.head = 14
        
        _ = applyMove(on: element)
        
        XCTAssertEqual(AccessibilityStrategyVisualMode.anchor, 14)
        XCTAssertEqual(AccessibilityStrategyVisualMode.head, 10)        
    }
    
    func test_that_if_the_anchor_is_the_end_of_the_selection_and_the_head_is_the_caret_location_then_it_switches_them() {
        let text = """
now we gonna use
some like a little
longer text hehe
tricky
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 59,
            caretLocation: 19,
            selectedLength: 1,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 17,
                end: 36
            )
        )
        
        AccessibilityStrategyVisualMode.anchor = 40
        AccessibilityStrategyVisualMode.head = 19
        
        _ = applyMove(on: element)
        
        XCTAssertEqual(AccessibilityStrategyVisualMode.anchor, 19)
        XCTAssertEqual(AccessibilityStrategyVisualMode.head, 40)  
    }
    
    func test_that_it_does_not_move_the_VM_head_and_anchor_if_they_are_both_the_same() {
        let text = """
another one
my friend
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 21,
            caretLocation: 15,
            selectedLength: 1,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 12,
                end: 21
            )
        )
        
        AccessibilityStrategyVisualMode.anchor = 15
        AccessibilityStrategyVisualMode.head = 15
        
        _ = applyMove(on: element)
        
        XCTAssertEqual(AccessibilityStrategyVisualMode.anchor, 15)
        XCTAssertEqual(AccessibilityStrategyVisualMode.head, 15)  
    }
    
}
