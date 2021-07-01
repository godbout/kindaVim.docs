@testable import kindaVim
import XCTest


class ASVML_o_Tests: ASVM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        VimEngine.shared.visualStyle = .linewise
    }
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asVisualMode.o(on: element) 
    }
    
}


// the 3 special cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
extension ASVML_o_Tests {
    
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
extension ASVML_o_Tests {
    
    func test_that_if_the_anchor_is_the_caret_location_and_the_head_is_the_end_of_the_selection_then_it_switches_them() {
        let text = "a sentence with a word, or more..."
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 34,
            caretLocation: 0,
            selectedLength: 1,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 34
            )
        )
        
        AccessibilityStrategyVisualMode.anchor = 0
        AccessibilityStrategyVisualMode.head = 34
        
        _ = applyMove(on: element)
        
        XCTAssertEqual(AccessibilityStrategyVisualMode.anchor, 34)
        XCTAssertEqual(AccessibilityStrategyVisualMode.head, 0)        
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
            caretLocation: 17,
            selectedLength: 19,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 17,
                end: 36
            )
        )
        
        AccessibilityStrategyVisualMode.anchor = 17
        AccessibilityStrategyVisualMode.head = 36
        
        _ = applyMove(on: element)
        
        XCTAssertEqual(AccessibilityStrategyVisualMode.anchor, 36)
        XCTAssertEqual(AccessibilityStrategyVisualMode.head, 17)  
    }

}
