@testable import kindaVim
import XCTest


// the ciDoubleQuote move uses the AS.ciInnerQuotedString function, so
// the tests related to grabbing the content within quotes is done there.
// here we just have the tests that are specific to ciDoubleQuote
class ASNM_ciDoubleQuote_Tests: ASNM_BaseTests {
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asNormalMode.ciDoubleQuote(on: element) 
    }
    
}

// Both
extension ASNM_ciDoubleQuote_Tests {
    
    func test_that_if_it_succeeds_it_drops_the_block_cursor() {
        let text = "so if that one \"succeeds\" it's gonna drop the bc in its own way"        
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 63,
            caretLocation: 15,
            selectedLength: 1,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 63
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        // the way to check for ciDoubleQuote that it loses the block cursor is through the selectedText
        XCTAssertEqual(returnedElement?.selectedText, "")
    }
    
    func test_that_if_it_does_not_succeed_it_keeps_the_current_block_cursor_which_is_on() {
        let text = "that one is gonna fail coz no quote"        
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 35,
            caretLocation: 28,
            selectedLength: 1,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 35
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        // the way to check it keeps the block cursor is that the returned element is the same as
        // the passed element
        XCTAssertEqual(returnedElement, element)
    }
  
}
