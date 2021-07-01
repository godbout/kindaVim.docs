@testable import kindaVim
import XCTest


class ASVMC_l_Tests: ASVM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        VimEngine.shared.visualStyle = .characterwise
    }
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asVisualMode.l(on: element) 
    }
    
}


// the 3 special cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
extension ASVMC_l_Tests {
    
    func test_that_if_the_TextElement_is_empty_it_works_and_does_not_move() {
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
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_but_not_on_an_empty_line_it_goes_back_one_character_and_selects_it() {
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
        
        XCTAssertEqual(returnedElement?.caretLocation, 27)
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_and_on_an_empty_line_it_works_and_does_not_move() {
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
            selectedLength: 0,
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
extension ASVMC_l_Tests {
    
    func test_that_if_the_anchor_is_before_the_head_it_selects_one_more_character_to_the_right_by_augmenting_the_selected_length() {
        let text = "well how can we test the selectedLength?..."
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 43,
            caretLocation: 22,
            selectedLength: 4,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 43
            )
        )
        
        AccessibilityStrategyVisualMode.anchor = 22
        AccessibilityStrategyVisualMode.head = 26
        
        let returnedElement = applyMove(on: element) 
        
        XCTAssertEqual(returnedElement?.caretLocation, 22)
        XCTAssertEqual(returnedElement?.selectedLength, 5)        
    }
    
    func test_that_if_the_head_is_before_the_anchor_it_unselects_one_character_to_the_right_by_moving_the_caret() {
        let text = "well how can we test the selectedLength?..."
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 43,
            caretLocation: 22,
            selectedLength: 4,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 43
            )
        )
        
        AccessibilityStrategyVisualMode.anchor = 26
        AccessibilityStrategyVisualMode.head = 22
        
        let returnedElement = applyMove(on: element) 
        
        XCTAssertEqual(returnedElement?.caretLocation, 23)
        XCTAssertEqual(returnedElement?.selectedLength, 3)    
    }
    
    func test_that_when_the_anchor_is_at_the_end_of_a_line_l_can_still_move_to_the_right() {
        let text = """
that was a bug
so we do a test
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 30,
            caretLocation: 11,
            selectedLength: 4,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 15
            )
        )
        
        AccessibilityStrategyVisualMode.anchor = 14
        AccessibilityStrategyVisualMode.head = 11
        
        let returnedElement = applyMove(on: element) 
        
        XCTAssertEqual(returnedElement?.caretLocation, 12)
        XCTAssertEqual(returnedElement?.selectedLength, 3)    
    }
    
}
