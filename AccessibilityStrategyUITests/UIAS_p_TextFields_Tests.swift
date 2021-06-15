@testable import kindaVim
import XCTest


// so p is a special one too because it sets the selectedText, and maybe
// move back the block cursor after. so we need to do a lot of tests through UI.
// some other tests that can do before hitting the ATEAdaptor are tested in the
// normal Unit Tests for p. this should cover it all.
// also we need to separate TextFields from TextViews tests because they will
// indeed behave differently: we will never paste linewise in TextFields
class UIAS_p_TextFields_Tests: UIAS_BaseTests {
    
    private func sendMoveThroughVimEngineAndGetBackUpdatedFocusedElement() -> AccessibilityTextElement? {
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .p))
        
        return AccessibilityTextElementAdaptor.fromAXFocusedElement()        
    }    
    
}


// the 3 special cases, but only 2 for TextFields
// as the last one doesn't apply
// - empty TextElement
// - caret at the end of TextElement but not on empty line
extension UIAS_p_TextFields_Tests {
    
    func test_that_if_the_TextField_is_empty_it_still_pastes() {
        let textInAXFocusedElement = ""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
                
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 1 of The 3 Cases", forType: .string)
                
        let finalElement = sendMoveThroughVimEngineAndGetBackUpdatedFocusedElement() 
        
        XCTAssertEqual(finalElement?.value, "test 1 of The 3 Cases")
        XCTAssertEqual(finalElement?.caretLocation, 20)
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextField_it_does_nothing_and_does_not_crash() {
        let textInAXFocusedElement = "the user has clicked out of the boundaries!"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 2 of The 3 Cases", forType: .string)
        
        let finalElement = sendMoveThroughVimEngineAndGetBackUpdatedFocusedElement()
        
        XCTAssertEqual(finalElement?.value, "the user has clicked out of the boundaries!")
        XCTAssertEqual(finalElement?.caretLocation, 42)
    }

}


// TextFields
extension UIAS_p_TextFields_Tests {
    
    func test_that_in_normal_setting_it_pastes_the_text_after_the_cursor_and_the_cursor_ends_up_at_the_end_of_the_pasted_text() {
        let textInAXFocusedElement = "we gonna paste some shit"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [])
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("text to paste!!!", forType: .string)
        
        let finalElement = sendMoveThroughVimEngineAndGetBackUpdatedFocusedElement()
        
        XCTAssertEqual(finalElement?.value, "we gonna paste some text to paste!!!shit")
        XCTAssertEqual(finalElement?.caretLocation, 35)
    }
    
}
