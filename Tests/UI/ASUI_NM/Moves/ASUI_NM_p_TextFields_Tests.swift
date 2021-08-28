@testable import kindaVim
import KeyCombination
import XCTest


// so p is a special one too because it sets the selectedText,
// and moves back the block cursor after. so we need to do a lot of tests through UI.
// some other tests that can do before hitting the ATEAdaptor are tested in the
// normal Unit Tests for p. this should cover it all.
// also we need to separate TextFields from TextViews tests because they will
// indeed behave differently: we will never paste linewise in TextFields
class UIASNM_p_TextFields_Tests: ASUI_NM_BaseTests {
    
    private func sendMoveThroughVimEngineAndGetBackAccessibilityElement() -> AccessibilityTextElement? {
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .p))
        
        return AccessibilityTextElementAdaptor.fromAXFocusedElement()        
    }    
    
}


// characterwise
extension UIASNM_p_TextFields_Tests {
    
    func test_that_in_normal_setting_it_pastes_the_text_after_the_block_cursor_and_the_block_cursor_ends_up_at_the_end_of_the_pasted_text() {
        let textInAXFocusedElement = "we gonna paste some shit"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])
        KindaVimEngine.shared.enterNormalMode()
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("text to paste!!!", forType: .string)
        
        KindaVimEngine.shared.lastYankStyle = .characterwise
        let accessibilityElement = sendMoveThroughVimEngineAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.value, "we gonna paste some text to paste!!!shit")
        XCTAssertEqual(accessibilityElement?.caretLocation, 35)
    }
    
}


// linewise
extension UIASNM_p_TextFields_Tests {
    
    func test_that_even_if_the_last_yank_was_linewise_it_still_pastes_as_characterwise_after_the_block_cursor_and_the_block_cursor_ends_up_at_the_end_of_the_pasted_text() {
        let textInAXFocusedElement = "linewise for TF is still pasted characterwise!"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.command])
        KindaVimEngine.shared.enterNormalMode()
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("text to pasta", forType: .string)
        
        KindaVimEngine.shared.lastYankStyle = .linewise
        let accessibilityElement = sendMoveThroughVimEngineAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.value, "ltext to pastainewise for TF is still pasted characterwise!")
        XCTAssertEqual(accessibilityElement?.caretLocation, 13)
    }
    
    func test_that_when_the_last_yank_was_linewise_and_the_line_was_ending_with_a_linefeed_the_linfeed_is_not_pasted_in_the_TextField() {
        let textInAXFocusedElement = "we should not paste linefeeds in the TF"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])
        KindaVimEngine.shared.enterNormalMode()
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("yanked with the linefeed\n", forType: .string)
        
        KindaVimEngine.shared.lastYankStyle = .linewise
        let accessibilityElement = sendMoveThroughVimEngineAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.value, "we should not paste linefeeds in the yanked with the linefeedTF")
        XCTAssertEqual(accessibilityElement?.caretLocation, 60)
    }
}


// emojis
extension UIASNM_p_TextFields_Tests {
    
    func test_that_it_handles_emojis() {
        let textInAXFocusedElement = "we go😂️😂️😂️nna paste some 💩️"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("text to 🥞️🥞️🥞️ paste!!!🥠️", forType: .string)
        
        KindaVimEngine.shared.lastYankStyle = .characterwise
        let accessibilityElement = sendMoveThroughVimEngineAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.value, "we go😂️😂️😂️nna paste some 💩️text to 🥞️🥞️🥞️ paste!!!🥠️")
        XCTAssertEqual(accessibilityElement?.caretLocation, 58)
        XCTAssertEqual(accessibilityElement?.selectedLength, 3)
    }
    
}
