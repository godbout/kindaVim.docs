@testable import kindaVim
import XCTest


class ASVM_V__Tests: ASVM_BaseTests {
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asVisualMode.V(on: element) 
    }
    
}


// the 3 special cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
//
// the second case has to be tested through UI Tests because it's calling the ATEAdaptor.lineFor
extension ASVM_V__Tests {
    
    func test_that_if_the_TextElement_is_empty_it_does_not_move_the_caret_but_set_the_anchor_and_head_to_0() {
        let text = ""
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 0,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: nil,
                start: nil,
                end: nil
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 0)
        XCTAssertEqual(returnedElement?.selectedLength, 0)
        XCTAssertNil(returnedElement?.selectedText)
        
        XCTAssertEqual(AccessibilityStrategyVisualMode.anchor, 0)
        XCTAssertEqual(AccessibilityStrategyVisualMode.head, 0)
    }
    
    // for V this case requires UI testing as we have to call lineFor in order to get the line info of the caretLocation - 1
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_but_not_on_an_empty_line_it_selects_the_whole_line() {}
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_and_on_an_empty_line_it_does_not_move_but_sets_the_anchor_and_head_to_caret_location() {
        let text = """
caret is on its
own empty
line

"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 31,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: nil,
                start: nil,
                end: nil
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 31)
        XCTAssertEqual(returnedElement?.selectedLength, 0)
        XCTAssertNil(returnedElement?.selectedText)
        
        XCTAssertEqual(AccessibilityStrategyVisualMode.anchor, 31)
        XCTAssertEqual(AccessibilityStrategyVisualMode.head, 31)
    }
    
}


// Both
extension ASVM_V__Tests {
    
    func test_that_it_selects_the_whole_line_even_if_it_does_not_end_with_a_linefeed() {
        let text = "a sentence without a linefeed"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 17,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 29
            )
        )
        
        VimEngine.shared.visualStyle = .characterwise
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 0)
        XCTAssertEqual(returnedElement?.selectedLength, 29)  
    }
    
}


// TextAreas
extension ASVM_V__Tests {
    
    func test_that_it_selects_the_whole_line_even_if_it_does_end_with_a_linefeed() {
        let text = """
now that's one with
a linefeed at the end
!
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 27,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 20,
                end: 42
            )
        )
        
        VimEngine.shared.visualStyle = .characterwise
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 20)
        XCTAssertEqual(returnedElement?.selectedLength, 22)  
    }
    
}


// anchor, head, caretLocation and selectedLength
extension ASVM_V__Tests {
    
    func test_that_if_we_just_entered_VisualMode_with_V_from_NormalMode_it_sets_the_anchor_and_caret_to_start_of_the_line_and_head_and_selection_to_end_of_line() {
        let text = """
entering with V from
normal mode means anchor
and head are nil
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 25,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 21,
                end: 46
            )
        )
        
        AccessibilityStrategyVisualMode.anchor = nil
        AccessibilityStrategyVisualMode.head = nil                
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 21)
        XCTAssertEqual(returnedElement?.selectedLength, 25)
        
        XCTAssertEqual(AccessibilityStrategyVisualMode.anchor, 21)
        XCTAssertEqual(AccessibilityStrategyVisualMode.head, 45)
    }
    
    func test_that_if_we_were_in_VisualMode_Characterwise_when_calling_V_it_sets_the_anchor_and_caret_to_start_of_the_line_and_head_and_selection_to_end_of_line() {
        let text = """
entering with V from
normal mode means anchor
and head are nil
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 0,
            selectedLength: 4,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 21
            )
        )
        
        AccessibilityStrategyVisualMode.anchor = 0
        AccessibilityStrategyVisualMode.head = 4  
        
        VimEngine.shared.visualStyle = .characterwise
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 0)
        XCTAssertEqual(returnedElement?.selectedLength, 21)
        
        XCTAssertEqual(AccessibilityStrategyVisualMode.anchor, 0)
        XCTAssertEqual(AccessibilityStrategyVisualMode.head, 20)
    }
    
    func test_that_if_we_were_already_in_VisualMode_Linewise_when_calling_V_it_sets_the_caret_to_the_head_as_long_as_the_head_is_not_after_the_line_end_limit() {
        let text = """
entering with V from
VM linewise will set
the caret to the head
if the head is not after the line end limit
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 46,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
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
    
    func test_that_if_we_were_already_in_VisualMode_Linewise_when_calling_V_it_sets_the_caret_to_the_end_limit_if_the_head_happened_to_be_after_the_end_limit() {
        let text = """
entering with V from
VM linewise will set
the caret to the head
if the head is not after the line end limit
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 46,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
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
    
}
