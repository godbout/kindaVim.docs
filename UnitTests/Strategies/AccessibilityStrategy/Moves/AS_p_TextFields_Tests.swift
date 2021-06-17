@testable import kindaVim
import XCTest

// ok, so p is way more complex than i thought at first:
// 1. we have to test TextFields and TextViews separately
//    this is because TextFields are supposed to have only one line, so even
//    if we paste something that has been copied in a linewise way, we will
//    still paste it characterwise. so mega tests for both, including The 3 Cases.
// 2. we have complementary UI Tests to check that the correct text is pasted in the correct
//    place and the cursor is positioned properly after (caret is before the last character of the pasted content)
// the truth is that those following tests are not necessary, as they will be covered inherently in the
// UI Tests also. but Unit Tests are cheap so here you go. more tests more better.
class AS_p_TextFields_Tests: AS_BaseTests {
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return accessibilityStrategy.p(on: element) 
    }
    
}


// the 3 special cases, but only 2 cases here as the last one
// doesn't exist for a TextField
// - empty TextElement
// - caret at the end of TextElement but not on empty line
extension AS_p_TextFields_Tests {
    
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
        NSPasteboard.general.setString("test 1 of The 3 Cases for TextField", forType: .string)
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 0)
        XCTAssertEqual(returnedElement?.selectedText, "test 1 of The 3 Cases for TextField")
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
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 2 of The 3 Cases for TextField", forType: .string)
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 43)     
        XCTAssertNotEqual(returnedElement?.selectedText, "test 2 of The 3 Cases for TextField")
    }
    
}


// characterwise
extension AS_p_TextFields_Tests {
    
    func test_that_in_normal_setting_it_pastes_the_content_inline_after_the_block_cursor() {
        let text = "some beautiful untouched text"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 19,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 29
            )
        )
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("gonna paste that", forType: .string)
        
        VimEngine.shared.lastYankStyle = .characterwise
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 20)     
        XCTAssertEqual(returnedElement?.selectedText, "gonna paste that")
    }
    
}


// linewise
extension AS_p_TextFields_Tests {

    func test_that_even_if_the_last_yanking_was_linewise_it_still_pastes_the_content_inline_after_the_block_cursor() {
        let text = "linewise in TF still pastes as characterwise of course!"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 30,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 55
            )
        )

        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("should be pasted linewise", forType: .string)

        VimEngine.shared.lastYankStyle = .characterwise
        let returnedElement = applyMove(on: element)

        XCTAssertEqual(returnedElement?.caretLocation, 31)
        XCTAssertEqual(returnedElement?.selectedText, "should be pasted linewise")
    }

}
