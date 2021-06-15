@testable import kindaVim
import XCTest

// ok, so p is way more complex than i thought at first:
// 1. we have to test TextFields and TextViews separately
// this is because TextFields are supposed to have only one line, so even
// if we paste something that has been copied in a linewise way, we will
// still paste it characterwise. so mega tests for both, including The 3 Cases.
// 2. because we set the selectedText, and we replace the block cursor after,
// we have to test through UI Tests. below are the basic tests we can do before
// all that magic happens, which means basically we can only test the selectedText content
class AS_p_Tests: AS_BaseTests {
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return accessibilityStrategy.p(on: element) 
    }
    
}


// TextFields
extension AS_p_Tests {
        
    // the 3 special cases, but only 2 cases here as the last one
    // doesn't exist for a TextField
    func test_that_if_the_TextField_is_empty_it_still_pastes() {
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
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 1 of The 3 Cases", forType: .string)
        
        let returnedElement = applyMove(on: element)
                
        XCTAssertEqual(returnedElement?.caretLocation, 0)
        XCTAssertEqual(returnedElement?.selectedText, "test 1 of The 3 Cases")
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextField_it_does_nothing_and_does_not_crash() {
        let text = "the user has clicked out of the boundaries!"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 43,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: nil,
                start: nil,
                end: nil
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 43)        
    }
    
}
