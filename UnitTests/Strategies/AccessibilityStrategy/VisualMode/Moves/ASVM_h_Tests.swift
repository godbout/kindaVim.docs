@testable import kindaVim
import XCTest


class ASVM_h_Tests: ASVM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        VimEngine.shared.visualStyle = .characterwise
    }
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asVisualMode.h(on: element) 
    }
    
}


// the 3 special cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
//extension ASVM_h_Tests {
//    
//    func test_that_if_the_TextElement_is_empty_it_does_nothing_and_does_not_crash() {
//        let text = ""
//        let element = AccessibilityTextElement(
//            role: .textField,
//            value: text,
//            caretLocation: 0,
//            currentLine: AccessibilityTextElementLine(
//                fullValue: text,
//                number: nil,
//                start: nil,
//                end: nil
//            )
//        )
//        
//        let returnedElement = applyMove(on: element)
//        
//        XCTAssertEqual(returnedElement?.caretLocation, 0)
//        XCTAssertEqual(returnedElement?.selectedLength, 0)
//        XCTAssertNil(returnedElement?.selectedText)
//    }
//    
//    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_but_not_on_an_empty_line_it_goes_back_one_character_and_selects_it() {
//        let text = """
//caret is
//gonna be at the end
//"""
//        let element = AccessibilityTextElement(
//            role: .textArea,
//            value: text,
//            caretLocation: 28,
//            currentLine: AccessibilityTextElementLine(
//                fullValue: text,
//                number: nil,
//                start: nil,
//                end: nil
//            )
//        )
//        
//        let returnedElement = applyMove(on: element)
//        
//        XCTAssertEqual(returnedElement?.caretLocation, 27)
//        XCTAssertEqual(returnedElement?.selectedLength, 1)
//        XCTAssertNil(returnedElement?.selectedText)
//    }
//    
//    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_and_on_an_empty_line_it_does_nothing_and_does_not_crash() {
//        let text = """
//caret is on its
//own empty
//line
//
//"""
//        let element = AccessibilityTextElement(
//            role: .textArea,
//            value: text,
//            caretLocation: 31,
//            currentLine: AccessibilityTextElementLine(
//                fullValue: text,
//                number: nil,
//                start: nil,
//                end: nil
//            )
//        )
//        
//        let returnedElement = applyMove(on: element)
//        
//        XCTAssertEqual(returnedElement?.caretLocation, 31)
//        XCTAssertEqual(returnedElement?.selectedLength, 0)
//        XCTAssertNil(returnedElement?.selectedText)
//    }
//    
//}


// linewise
extension ASVM_h_Tests {
    
    func test_that_in_visual_linewise_it_does_nothing() {
        let text = "h will only move stuff in VM characterwise"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 21,
            selectedLength: 2,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 42
            )
        )
        
        VimEngine.shared.visualStyle = .linewise
        
        AccessibilityStrategyVisualMode.anchor = 21
        AccessibilityStrategyVisualMode.head = 23
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 21)
        XCTAssertEqual(returnedElement?.selectedLength, 2)        
    }
    
}


// Both
extension ASVM_h_Tests {
    
    func test_that_if_the_anchor_is_before_the_head_it_unselects_one_character_to_the_left_by_reducing_the_selected_length() {
        let text = "well how can we test the selectedLength?..."
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 22,
            selectedLength: 4,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 43
            )
        )
        
        AccessibilityStrategyVisualMode.anchor = 22
        AccessibilityStrategyVisualMode.head = 26
        
        let returnedElement = applyMove(on: element) 
        
        XCTAssertEqual(returnedElement?.caretLocation, 22)
        XCTAssertEqual(returnedElement?.selectedLength, 3)        
    }
    
    func test_that_if_the_head_is_before_the_anchor_it_selects_one_more_character_to_the_left_by_moving_the_caret() {
        let text = "well how can we test the selectedLength?..."
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 22,
            selectedLength: 4,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 43
            )
        )
        
        AccessibilityStrategyVisualMode.anchor = 26
        AccessibilityStrategyVisualMode.head = 22
        
        let returnedElement = applyMove(on: element) 
        
        XCTAssertEqual(returnedElement?.caretLocation, 21)
        XCTAssertEqual(returnedElement?.selectedLength, 5)    
    }
    
    func test_that_if_the_caret_is_at_the_start_of_the_line_and_the_selection_is_more_than_one_it_can_still_moves_and_reduce_the_selection() {
        let text = """
yeah
that's kinda weird when
it bugs
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 5,
            selectedLength: 5,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 5,
                end: 29
            )
        )
                   
        AccessibilityStrategyVisualMode.anchor = 5
        AccessibilityStrategyVisualMode.head = 10
        
        let returnedElement = applyMove(on: element)        
        
        XCTAssertEqual(returnedElement?.caretLocation, 5)
        XCTAssertEqual(returnedElement?.selectedLength, 4)
    }
    
}
