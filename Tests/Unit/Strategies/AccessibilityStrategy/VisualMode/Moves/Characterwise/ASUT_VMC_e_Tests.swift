@testable import kindaVim
import XCTest


// see b for blah blah
class ASUT_VMC_e_Tests: ASVM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.visualStyle = .characterwise
    }
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asVisualMode.e(on: element) 
    }
    
}


// Both
extension ASUT_VMC_e_Tests {
    
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


// emojis
extension ASUT_VMC_e_Tests {
    
    func test_that_it_handles_emojis_when_head_and_anchor_are_the_same() {
        let text = "because ☀️urrently 🤖️t seems it does"
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 37,
            caretLocation: 19,
            selectedLength: 3,
            selectedText: "🤖️",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 37
            )
        )
        
        AccessibilityStrategyVisualMode.anchor = 19
        AccessibilityStrategyVisualMode.head = 19
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 19)
        XCTAssertEqual(returnedElement?.selectedLength, 4)   
        XCTAssertNil(returnedElement?.selectedText)
    }
    
    func test_that_it_handles_emojis_when_the_head_is_before_the_anchor_and_will_stay_before_even_after_the_move_is_done() {
        let text = "because ☀️urrently 🤖️t seems it does"
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 37,
            caretLocation: 8,
            selectedLength: 14,
            selectedText: "☀️urrently 🤖️",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 37
            )
        )
        
        AccessibilityStrategyVisualMode.anchor = 19
        AccessibilityStrategyVisualMode.head = 8
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 17)
        XCTAssertEqual(returnedElement?.selectedLength, 5)   
        XCTAssertNil(returnedElement?.selectedText)
    }
    
    func test_that_it_handles_emojis_when_the_head_is_before_the_anchor_and_goes_after_the_anchor_after_the_move_is_done() {
        let text = "because ☀️🤖️🤖️🤖️🤖️🤖️🤖️ t seems it does"
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 44,
            caretLocation: 8,
            selectedLength: 11,
            selectedText: "☀️🤖️🤖️🤖️",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 44
            )
        )
        
        AccessibilityStrategyVisualMode.anchor = 16
        AccessibilityStrategyVisualMode.head = 8
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 16)
        XCTAssertEqual(returnedElement?.selectedLength, 12)   
        XCTAssertNil(returnedElement?.selectedText)
    }
    
    func test_that_it_handles_emojis_by_not_getting_stuck_in_front_of_them_sacrebleu() {
        let text = "because🤖️🤖️🤖️🤖️🤖️🤖️ t seems it does"
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 41,
            caretLocation: 5,
            selectedLength: 2,
            selectedText: "se",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 41
            )
        )
        
        AccessibilityStrategyVisualMode.anchor = 5
        AccessibilityStrategyVisualMode.head = 6
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 5)
        XCTAssertEqual(returnedElement?.selectedLength, 20)   
        XCTAssertNil(returnedElement?.selectedText)
    }
    
}
