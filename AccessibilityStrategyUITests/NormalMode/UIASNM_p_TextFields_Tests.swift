@testable import kindaVim
import XCTest


// so p is a special one too because it sets the selectedText,
// and moves back the block cursor after. so we need to do a lot of tests through UI.
// some other tests that can do before hitting the ATEAdaptor are tested in the
// normal Unit Tests for p. this should cover it all.
// also we need to separate TextFields from TextViews tests because they will
// indeed behave differently: we will never paste linewise in TextFields
class UIASNM_p_TextFields_Tests: UIAS_BaseTests {
    
    private func sendMoveThroughVimEngineAndGetBackUpdatedFocusedElement() -> AccessibilityTextElement? {
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .p))
        
        return AccessibilityTextElementAdaptor.fromAXFocusedElement()        
    }    
    
}


// the 3 special cases, but only 2 for TextFields as the last one doesn't apply
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// also the tests are valid for characterwise and linewise, as we actually don't even check
// p should behave the same for both linewise or characterwise last yanked style. it will
// always behave characterwise because no linefeed in TextFields. (still having some tests
// below to sleep better at night :D)
extension UIASNM_p_TextFields_Tests {
    
    func test_that_if_the_TextField_is_empty_it_still_pastes() {
        let textInAXFocusedElement = ""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
                
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 1 of The 3 Cases", forType: .string)
                
        VimEngine.shared.lastYankStyle = .characterwise
        let finalElement = sendMoveThroughVimEngineAndGetBackUpdatedFocusedElement() 
        
        XCTAssertEqual(finalElement?.value, "test 1 of The 3 Cases")
        XCTAssertEqual(finalElement?.caretLocation, 20)
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextField_it_still_pastes() {
        let textInAXFocusedElement = "the user has clicked out of the boundaries!"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 2 of The 3 Cases", forType: .string)
        
        VimEngine.shared.lastYankStyle = .characterwise
        let finalElement = sendMoveThroughVimEngineAndGetBackUpdatedFocusedElement()
        
        XCTAssertEqual(finalElement?.value, "the user has clicked out of the boundaries!test 2 of The 3 Cases")
        XCTAssertEqual(finalElement?.caretLocation, 63)
    }

}


// characterwise
extension UIASNM_p_TextFields_Tests {
    
    func test_that_in_normal_setting_it_pastes_the_text_after_the_block_cursor_and_the_block_cursor_ends_up_at_the_end_of_the_pasted_text() {
        let textInAXFocusedElement = "we gonna paste some shit"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [])
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("text to paste!!!", forType: .string)
        
        VimEngine.shared.lastYankStyle = .characterwise
        let finalElement = sendMoveThroughVimEngineAndGetBackUpdatedFocusedElement()
        
        XCTAssertEqual(finalElement?.value, "we gonna paste some text to paste!!!shit")
        XCTAssertEqual(finalElement?.caretLocation, 35)
    }
    
}


// linewise
extension UIASNM_p_TextFields_Tests {
    
    func test_that_even_if_the_last_yank_was_linewise_it_still_pastes_as_characterwise_after_the_block_cursor_and_the_block_cursor_ends_up_at_the_end_of_the_pasted_text() {
        let textInAXFocusedElement = "linewise for TF is still pasted characterwise!"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.command])
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("text to pasta", forType: .string)
        
        VimEngine.shared.lastYankStyle = .linewise
        let finalElement = sendMoveThroughVimEngineAndGetBackUpdatedFocusedElement()
        
        XCTAssertEqual(finalElement?.value, "ltext to pastainewise for TF is still pasted characterwise!")
        XCTAssertEqual(finalElement?.caretLocation, 13)
    }
    
    func test_that_when_the_last_yank_was_linewise_and_the_line_was_ending_with_a_linefeed_the_linfeed_is_not_pasted_in_the_TextField() {
        let textInAXFocusedElement = "we should not paste linefeeds in the TF"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [])
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("yanked with the linefeed\n", forType: .string)
        
        VimEngine.shared.lastYankStyle = .linewise
        let finalElement = sendMoveThroughVimEngineAndGetBackUpdatedFocusedElement()
        
        XCTAssertEqual(finalElement?.value, "we should not paste linefeeds in the yanked with the linefeedTF")
        XCTAssertEqual(finalElement?.caretLocation, 60)
    }
}
