@testable import kindaVim
import XCTest


// there's one test that is done through UI because tricky: when the caret is within a word
// and pressing b will go from after the anchor to before the anchor. this requires updating Self.anchor
// which is hard to understand later on if tested here, so the test is done through UI.
class ASUT_VMC_b_Tests: ASVM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.visualStyle = .characterwise
    }
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asVisualMode.b(on: element) 
    }
    
}


// Both
extension ASUT_VMC_b_Tests {
    
    func test_that_if_the_head_is_after_the_anchor_it_reduces_the_selected_length_up_to_the_beginning_of_the_word_backward() {    
        let text = "gonna start with text moves in Visual Mode"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 42,
            caretLocation: 10,
            selectedLength: 25,
            selectedText: "t with text moves in Visu",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 42
            )
        )
        
        AccessibilityStrategyVisualMode.anchor = 10
        AccessibilityStrategyVisualMode.head = 35
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 10)
        XCTAssertEqual(returnedElement?.selectedLength, 21)       
        XCTAssertNil(returnedElement?.selectedText)
    }
    
    func test_that_if_the_anchor_is_after_the_head_it_moves_the_caret_to_the_beginning_of_the_word_backward_and_increases_the_selected_length() {
        let text = """
in Visual Mode Characterwise we
always move from the anchor, not
from the caret location
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 88,
            caretLocation: 57,
            selectedLength: 11,
            selectedText: """
or, not
fro
""",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 32,
                end: 65
            )
        )
        
        AccessibilityStrategyVisualMode.anchor = 67
        AccessibilityStrategyVisualMode.head = 57
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 53)
        XCTAssertEqual(returnedElement?.selectedLength, 15)      
        XCTAssertNil(returnedElement?.selectedText)
    }
    
    func test_that_if_the_anchor_and_the_head_are_equal_it_does_not_get_blocked() {
        let text = "because currently it seems it does"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 34,
            caretLocation: 18,
            selectedLength: 1,
            selectedText: "i",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 34
            )
        )
        
        AccessibilityStrategyVisualMode.anchor = 18
        AccessibilityStrategyVisualMode.head = 18
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 8)
        XCTAssertEqual(returnedElement?.selectedLength, 11)   
        XCTAssertNil(returnedElement?.selectedText)
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_and_on_an_empty_line_it_works_and_goes_to_the_beginning_of_the_word() {
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
            selectedText: "",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 4,
                start: 31,
                end: 31
            )
        )
        
        AccessibilityStrategyVisualMode.anchor = 31
        AccessibilityStrategyVisualMode.head = 31
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 26)
        XCTAssertEqual(returnedElement?.selectedLength, 5)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
}



// emojis
extension ASUT_VMC_b_Tests {
    
    func test_that_it_handles_emojis_when_head_and_anchor_are_the_same() {
        let text = "because currently 🤖️t seems it does"
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 36,
            caretLocation: 18,
            selectedLength: 3,
            selectedText: "🤖️",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 36
            )
        )
        
        AccessibilityStrategyVisualMode.anchor = 18
        AccessibilityStrategyVisualMode.head = 18
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 8)
        XCTAssertEqual(returnedElement?.selectedLength, 13)   
        XCTAssertNil(returnedElement?.selectedText)
    }
    
    func test_that_it_handles_emojis_when_the_head_is_before_the_anchor() {
        let text = "because ☀️urrently 🤖️t seems it does"
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 37,
            caretLocation: 10,
            selectedLength: 12,
            selectedText: "urrently 🤖️",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 37
            )
        )
        
        AccessibilityStrategyVisualMode.anchor = 19
        AccessibilityStrategyVisualMode.head = 10
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 8)
        XCTAssertEqual(returnedElement?.selectedLength, 14)   
        XCTAssertNil(returnedElement?.selectedText)
    }
    
}
