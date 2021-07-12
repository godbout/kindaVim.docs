@testable import kindaVim
import XCTest


class ASNM_percent_Tests: ASNM_BaseTests {
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asNormalMode.percent(on: element) 
    }
    
}


// Both
extension ASNM_percent_Tests {
    
    func test_that_the_caret_does_not_move_if_it_cannot_find_an_item_to_pair() {
        let text = "no item to pair on this line"
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 28,
            caretLocation: 4,
            selectedLength: 1,
            selectedText: "t",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 28
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 4)        
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }    
    
    func test_that_it_finds_the_next_item_to_match_and_goes_to_the_pairing_item_on_a_same_line() {
        let text = """
a line without shit to pair
and a ( nice pair line ) :))
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 56,
            caretLocation: 30,
            selectedLength: 1,
            selectedText: "d",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 28,
                end: 56
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 51)
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
    func test_that_if_the_pair_cannot_be_matched_then_it_does_not_move() {
        let text = "the last { will not match } because there's { no closing"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 56,
            caretLocation: 34,
            selectedLength: 1,
            selectedText: "e",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 56
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 34)
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
    func test_that_it_always_works_with_brackets() {
        let text = "because by default the [ unmatched functions ] don't ] handle brackets"
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 70,
            caretLocation: 14,
            selectedLength: 1,
            selectedText: "a",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 62
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 45)
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
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
            length: 40,
            caretLocation: 39,
            selectedLength: 1,
            selectedText: "}",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 3,
                start: 39,
                end: 40
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 16)
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
}
