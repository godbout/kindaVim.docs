@testable import kindaVim
import XCTest


class ASNM_percent_Tests: ASNM_BaseTests {
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asNormalMode.percent(on: element) 
    }
    
}


// the 3 special cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
//extension ASNM_percent_Tests {
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
//    }
//    
//    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_but_not_on_an_empty_line_it_does_nothing_and_does_not_crash() {
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
//        XCTAssertEqual(returnedElement?.caretLocation, 28)        
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
//    }    
//    
//}


// Both
extension ASNM_percent_Tests {
    
    func test_that_the_caret_does_not_move_if_it_cannot_find_an_item_to_pair() {
        let text = "no item to pair on this line"
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 4,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 28
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 4)
    }    
    
    func test_that_it_finds_the_next_item_to_match_and_goes_to_the_pairing_item_on_a_same_line() {
        let text = """
a line without shit to pair
and a ( nice pair line ) :))
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 30,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 28,
                end: 56
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 51)
    }
    
    func test_that_if_the_pair_cannot_be_matched_then_it_does_not_move() {
        let text = "the last { will not match } because there's { no closing"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 34,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 56
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 34)
    }
    
    func test_that_it_always_works_with_brackets() {
        let text = "because by default the [ unmatched functions ] don't ] handle brackets"
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 14,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 55
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 45)
    }
    
}


// TextViews
extension ASNM_percent_Tests {
    
    func test_that_it_finds_the_next_item_to_match_and_goes_to_the_pairing_item_even_on_a_different_line() {
        let text = """
func someBull() {
    let var = "huhu"
}
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 39,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 39,
                end: 40
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 16)
    }
    
}
