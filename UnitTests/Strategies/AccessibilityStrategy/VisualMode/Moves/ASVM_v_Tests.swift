@testable import kindaVim
import XCTest


class ASVM_v_Tests: ASVM_BaseTests {
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asVisualMode.v(on: element) 
    }
    
}


// the 3 special cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
//extension ASVM_v_Tests {
//    
//    func test_that_if_the_TextElement_is_empty_it_does_not_move_the_caret_but_set_the_anchor_and_head_to_0() {
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
//        
//        XCTAssertEqual(AccessibilityStrategyVisualMode.anchor, 0)
//        XCTAssertEqual(AccessibilityStrategyVisualMode.head, 0)
//    }
//    
//    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_but_not_on_an_empty_line_it_goes_back_one_character_and_selects_it_and_sets_it_to_be_the_anchor_and_head() {
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
//        
//        XCTAssertEqual(AccessibilityStrategyVisualMode.anchor, 27)
//        XCTAssertEqual(AccessibilityStrategyVisualMode.head, 27)
//    }
//    
//    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_and_on_an_empty_line_it_does_not_move_but_sets_the_anchor_and_head_to_caret_location() {
//        let text = """
//caret is on its
//own emptyfjsl
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
//        
//        XCTAssertEqual(AccessibilityStrategyVisualMode.anchor, 31)
//        XCTAssertEqual(AccessibilityStrategyVisualMode.head, 31)
//    }
//    
//}


// anchor, head, caretLocation and selectedLength
extension ASVM_v_Tests {
    
    func test_that_if_we_just_entered_VisualMode_with_v_from_NormalMode_it_sets_the_anchor_and_head_to_the_caret_location() {
        let text = """
entering with v from
normal mode means anchor
and head are nil
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 62,
            caretLocation: 31,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 21,
                end: 46
            )
        )
        
        AccessibilityStrategyVisualMode.anchor = nil
        AccessibilityStrategyVisualMode.head = nil                
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 31)
        
        XCTAssertEqual(AccessibilityStrategyVisualMode.anchor, 31)
        XCTAssertEqual(AccessibilityStrategyVisualMode.head, 31)
    }
    
    func test_that_if_we_were_already_in_VisualMode_Linewise_when_calling_v_it_sets_the_caret_and_anchor_to_the_head_as_long_as_the_head_is_not_after_the_line_end_limit() {
        let text = """
entering with v from
VM linewise will set
the caret to the head
if the head is not after the line end limit
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 107,
            caretLocation: 42,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 3,
                start: 42,
                end: 64
            )
        )
        
        AccessibilityStrategyVisualMode.anchor = 62
        AccessibilityStrategyVisualMode.head = 42 
        
        VimEngine.shared.visualStyle = .linewise
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 42)        
    }    
    
    func test_that_if_we_were_already_in_VisualMode_Linewise_when_calling_v_it_sets_the_caret_and_anchor_to_the_end_limit_if_the_head_happened_to_be_after_the_end_limit() {
        let text = """
entering with v from
VM linewise will set
the caret to the head
if the head is not after the line end limit
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 107,
            caretLocation: 46,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 3,
                start: 42,
                end: 64
            )
        )
        
        AccessibilityStrategyVisualMode.anchor = 42
        AccessibilityStrategyVisualMode.head = 63
        
        VimEngine.shared.visualStyle = .linewise
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 62)      
    }
    
    func test_that_if_we_were_already_in_VisualMode_Characterwise_when_calling_v_it_sets_the_caret_to_the_head_location_that_will_never_be_behind_the_end_limit() {
        let text = """
entering with v from
VM linewise will set
the caret to the head
if the head is not after the line end limit
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 107,
            caretLocation: 55,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 3,
                start: 42,
                end: 64
            )
        )
        
        AccessibilityStrategyVisualMode.anchor = 55
        AccessibilityStrategyVisualMode.head = 58
        
        VimEngine.shared.visualStyle = .linewise
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 58)      
    }
    
}
