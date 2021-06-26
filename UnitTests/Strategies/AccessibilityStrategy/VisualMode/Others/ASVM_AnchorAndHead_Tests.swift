@testable import kindaVim
import XCTest


class ASVM_AnchorAndHead_Tests: ASVM_BaseTests {}


// both
extension ASVM_AnchorAndHead_Tests {
    
    func test_that_anchor_and_head_get_reset_when_entering_NormalMode() {
        AccessibilityStrategyVisualMode.anchor = 69
        // head = 69 haha
        AccessibilityStrategyVisualMode.head = 69
        
        VimEngine.shared.enterNormalMode()
        
        XCTAssertNil(AccessibilityStrategyVisualMode.anchor)
        XCTAssertNil(AccessibilityStrategyVisualMode.head)
    }
    
}


// head
extension ASVM_AnchorAndHead_Tests {
    
    func test_that_when_setting_the_selectedLength_the_head_gets_updated() {
        let text = "hello"
        var element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 0,
            selectedLength: 2,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 2
            )
        )
        
        AccessibilityStrategyVisualMode.anchor = 0
        AccessibilityStrategyVisualMode.head = 69
        
        element.selectedLength = 3
        
        XCTAssertNotEqual(AccessibilityStrategyVisualMode.head, 69)
    }
    
    func test_that_when_the_caret_location_goes_before_the_anchor_then_the_head_becomes_the_caret_location() {
        let text = """
another long shit
for testing the anchor
and head
"""
        var element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 27,
            selectedLength: 3,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 18,
                end: 41
            )
        )
        
        AccessibilityStrategyVisualMode.anchor = 30
        AccessibilityStrategyVisualMode.head = 37
        
        element.caretLocation = 26
        element.selectedLength = 4
        
        XCTAssertEqual(AccessibilityStrategyVisualMode.head, 26)    
    }
    
    func test_that_when_the_caret_location_goes_after_the_anchor_then_the_head_becomes_the_caret_location_plus_the_selected_length_minus_1_lol() {
        let text = """
another long shit
for testing the anchor
and head
"""
        var element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 27,
            selectedLength: 3,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 18,
                end: 41
            )
        )
        
        AccessibilityStrategyVisualMode.anchor = 20
        AccessibilityStrategyVisualMode.head = 25
        
        element.caretLocation = 28
        element.selectedLength = 4
        
        XCTAssertEqual(AccessibilityStrategyVisualMode.head, 31)    
    }
    
}

