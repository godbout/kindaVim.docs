@testable import kindaVim
import XCTest


// see b for blah blah
class ASVMC_e_Tests: ASVM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.visualStyle = .characterwise
    }
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asVisualMode.e(on: element) 
    }
    
}


// Both
extension ASVMC_e_Tests {
    
    func test_that_if_the_head_is_after_the_anchor_it_extends_the_selected_length_to_the_end_of_the_word_forward() {
        let text = "gonna start with text moves in Visual Mode"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 42,
            caretLocation: 14,
            selectedLength: 9,
            selectedText: "th text m",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 42
            )
        )
        
        AccessibilityStrategyVisualMode.anchor = 14
        AccessibilityStrategyVisualMode.head = 22
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 14)
        XCTAssertEqual(returnedElement?.selectedLength, 13)   
        XCTAssertNil(returnedElement?.selectedText)
    }
    
    func test_that_if_the_head_is_before_the_anchor_it_reduces_the_selected_length_to_the_end_of_the_word_forward() {
        let text = "gonna start with text moves in Visual Mode"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 42,
            caretLocation: 14,
            selectedLength: 9,
            selectedText: "th text m",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 42
            )
        )
        
        AccessibilityStrategyVisualMode.anchor = 22
        AccessibilityStrategyVisualMode.head = 14
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 15)
        XCTAssertEqual(returnedElement?.selectedLength, 8) 
        XCTAssertNil(returnedElement?.selectedText)
    }
    
    func test_that_if_the_head_and_the_anchor_are_equal_it_does_not_get_blocked() {
        let text = "the first time we tried those moves we had some problems :D"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 59,
            caretLocation: 26,
            selectedLength: 1,
            selectedText: "o",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 59
            )
        )
        
        AccessibilityStrategyVisualMode.anchor = 26
        AccessibilityStrategyVisualMode.head = 26
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 26)
        XCTAssertEqual(returnedElement?.selectedLength, 3)  
        XCTAssertNil(returnedElement?.selectedText)
    }
    
}
