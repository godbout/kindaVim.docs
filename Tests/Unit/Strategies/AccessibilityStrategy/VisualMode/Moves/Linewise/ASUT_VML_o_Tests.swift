@testable import kindaVim
import KeyCombination
import XCTest


class ASUT_VML_o_Tests: ASVM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.visualStyle = .linewise
    }
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asVisualMode.o(on: element) 
    }
    
}


// Both
extension ASUT_VML_o_Tests {
    
    func test_that_if_the_anchor_is_the_caret_location_and_the_head_is_the_end_of_the_selection_then_it_switches_them() {
        let text = "a sentence with a word, or more..."
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 34,
            caretLocation: 0,
            selectedLength: 1,
            selectedText: "a",
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
            selectedText: "some like a little\n",
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


// emojis
// still no need here
extension ASUT_VML_o_Tests {}
