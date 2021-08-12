@testable import kindaVim
import XCTest


// p for TextViews is special bis
// the pasting style will depend on how the last yanking was made
// if it was characterwise, pasting paste in line
// if it was linewise, pasting paste on a new line below
class ASUI_NM_p_TextViews_Tests: ASUI_NM_BaseTests {
    
    private func sendMoveThroughVimEngineAndGetBackAccessibilityElement() -> AccessibilityTextElement? {
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .p))
        
        return AccessibilityTextElementAdaptor.fromAXFocusedElement()        
    }   
    
}


// characterwise
extension ASUI_NM_p_TextViews_Tests {
    
    func test_that_in_normal_setting_it_pastes_the_text_after_the_block_cursor_and_if_the_text_does_not_contain_a_linefeed_the_block_cursor_ends_up_at_the_end_of_the_pasted_text() {
        let textInAXFocusedElement = """
time to paste
in TextViews
ho ho ho
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])
        KindaVimEngine.shared.enterNormalMode()
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("pastaing", forType: .string)
        
        KindaVimEngine.shared.lastYankStyle = .characterwise
        let accessibilityElement = sendMoveThroughVimEngineAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.value, """
time to paste
in pastaingTextViews
ho ho ho
"""
        )
        XCTAssertEqual(accessibilityElement?.caretLocation, 24)
    }
    
    func test_that_in_normal_setting_it_pastes_the_text_after_the_block_cursor_and_if_the_text_contains_a_linefeed_the_block_cursor_ends_up_at_the_beginning_of_the_pasted_text() {
        let textInAXFocusedElement = """
time to paste
in TextViews
ho ho ho
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])
        KindaVimEngine.shared.enterNormalMode()
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("😂️astaing\nmy man!", forType: .string)
        
        KindaVimEngine.shared.lastYankStyle = .characterwise
        let accessibilityElement = sendMoveThroughVimEngineAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.value, """
time to paste
in 😂️astaing
my man!TextViews
ho ho ho
"""
        )
        XCTAssertEqual(accessibilityElement?.caretLocation, 17)
    }
    
    func test_that_pasting_on_an_empty_line_does_not_paste_on_a_line_below_but_stays_on_the_same_line_and_does_not_stick_with_the_next_line() {
        let textInAXFocusedElement = """
gonna have an empty line

here's the last one
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        KindaVimEngine.shared.enterNormalMode()
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("text for the new line", forType: .string)
        
        KindaVimEngine.shared.lastYankStyle = .characterwise
        let accessibilityElement = sendMoveThroughVimEngineAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.value, """
gonna have an empty line
text for the new line
here's the last one
"""
        )
        XCTAssertEqual(accessibilityElement?.caretLocation, 45)    
    }
    
}


// linewise
extension ASUI_NM_p_TextViews_Tests {
    
    func test_that_in_normal_setting_it_pasts_the_content_on_a_new_line_below() {
        let textInAXFocusedElement = """
we gonna linewise paste
on a line that is not
the last so there's already
a linefeed at the end of the line
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [])
        KindaVimEngine.shared.enterNormalMode()
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("should paste that somewhere\n", forType: .string)
        
        KindaVimEngine.shared.lastYankStyle = .linewise
        let accessibilityElement = sendMoveThroughVimEngineAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.value, """
we gonna linewise paste
on a line that is not
the last so there's already
should paste that somewhere
a linefeed at the end of the line
"""
        )
        XCTAssertEqual(accessibilityElement?.caretLocation, 74)
        
    }
    
    func test_that_if_the_last_linewise_yanked_line_did_not_have_a_linefeed_pasting_it_will_add_the_linefeed_if_we_are_not_on_the_last_line() {
        let textInAXFocusedElement = """
when we yank the last line it doesn't contain
a linefeed but a linefeed should be pasted
if we are not pasting on the last line
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [])
        KindaVimEngine.shared.enterNormalMode()
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("we pasted the last line so no linefeed", forType: .string)
        
        KindaVimEngine.shared.lastYankStyle = .linewise
        let accessibilityElement = sendMoveThroughVimEngineAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.value, """
when we yank the last line it doesn't contain
a linefeed but a linefeed should be pasted
we pasted the last line so no linefeed
if we are not pasting on the last line
"""
        )
        XCTAssertEqual(accessibilityElement?.caretLocation, 89)
        
    }
    
    func test_that_if_on_the_last_line_and_the_last_yanking_style_was_linewise_it_pastes_the_content_on_a_new_line_below_without_an_ending_linefeed() {
        let textInAXFocusedElement = """
now we gonna linewise paste
after the last line
so we need to add the linefeed
ourselves
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [])
        KindaVimEngine.shared.enterNormalMode()
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("new line to paste after last line\n", forType: .string)
        
        KindaVimEngine.shared.lastYankStyle = .linewise
        let accessibilityElement = sendMoveThroughVimEngineAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.value, """
now we gonna linewise paste
after the last line
so we need to add the linefeed
ourselves
new line to paste after last line
"""
        )
        XCTAssertEqual(accessibilityElement?.caretLocation, 89)
    }
    
    func test_that_when_pasting_the_new_line_the_block_cursor_goes_to_the_first_non_blank_of_the_new_line() {
        let textInAXFocusedElement = """
so now we gonna
have to move the caret
to the first non blank of the copied line
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        KindaVimEngine.shared.enterNormalMode()
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("   the copied line has non blanks\n", forType: .string)
        
        KindaVimEngine.shared.lastYankStyle = .linewise
        let accessibilityElement = sendMoveThroughVimEngineAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.value, """
so now we gonna
have to move the caret
   the copied line has non blanks
to the first non blank of the copied line
"""
        )
        XCTAssertEqual(accessibilityElement?.caretLocation, 42)
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextArea_and_on_an_empty_line_it_still_pastes_but_without_an_ending_linefeed() {
        let textInAXFocusedElement = """
this should paste
after a new line and
not add a linefeed

"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [])
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 3 of The 3 Cases for TextArea linewise\n", forType: .string)
        
        KindaVimEngine.shared.lastYankStyle = .linewise
        let accessibilityElement = sendMoveThroughVimEngineAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.value, """
this should paste
after a new line and
not add a linefeed

test 3 of The 3 Cases for TextArea linewise
"""
        )
        XCTAssertEqual(accessibilityElement?.caretLocation, 59)
    }
    
}


// emojis
extension ASUI_NM_p_TextViews_Tests {
    
    func test_that_it_handles_emojis_characterwise() {
        let textInAXFocusedElement = """
time to paste
in 🚬️
ho ho ho
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        KindaVimEngine.shared.enterNormalMode()
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("pastain🤡️", forType: .string)
        
        KindaVimEngine.shared.lastYankStyle = .characterwise
        let accessibilityElement = sendMoveThroughVimEngineAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.value, """
time to paste
in 🚬️pastain🤡️
ho ho ho
"""
        )
        XCTAssertEqual(accessibilityElement?.caretLocation, 27)
        XCTAssertEqual(accessibilityElement?.selectedLength, 3)
    }
    
    func test_that_it_handles_emojis_linewise() {
        let textInAXFocusedElement = """
we gonna linewise paste
on a line that is not
the last so there'🚨️ 💭️
a linefeed at the end of the line
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [])
        KindaVimEngine.shared.enterNormalMode()
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("🦶️👋️ould paste that somewhere 🧑‍🌾️\n", forType: .string)
        
        KindaVimEngine.shared.lastYankStyle = .linewise
        let accessibilityElement = sendMoveThroughVimEngineAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.value, """
we gonna linewise paste
on a line that is not
the last so there'🚨️ 💭️
🦶️👋️ould paste that somewhere 🧑‍🌾️
a linefeed at the end of the line
"""
        )
        XCTAssertEqual(accessibilityElement?.caretLocation, 72)
        XCTAssertEqual(accessibilityElement?.selectedLength, 3)
        
    }
    
}
