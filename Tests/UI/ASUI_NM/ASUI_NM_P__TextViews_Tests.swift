@testable import kindaVim
import XCTest


// see p for blah blah
class UIASNM_P__TextViews_Tests: ASUI_NM_BaseTests {

    private func sendMoveThroughVimEngineAndGetBackAccessibilityElement() -> AccessibilityTextElement? {
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .P))

        return AccessibilityTextElementAdaptor.fromAXFocusedElement()
    }

}


// characterwise
// the 3 special cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
extension UIASNM_P__TextViews_Tests {

    func test_that_if_the_TextArea_is_empty_it_still_pastes() {
        let textInAXFocusedElement = ""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()

        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 1 of The 3 Cases for TextArea P", forType: .string)

        KindaVimEngine.shared.lastYankStyle = .characterwise
        let accessibilityElement = sendMoveThroughVimEngineAndGetBackAccessibilityElement()

        XCTAssertEqual(accessibilityElement?.value, "test 1 of The 3 Cases for TextArea P")
        XCTAssertEqual(accessibilityElement?.caretLocation, 35)
    }

    func test_that_if_the_caret_is_at_the_last_character_of_the_TextArea_it_still_pastes() {
        let textInAXFocusedElement = "you're out of the boundaries buddy"
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [])

        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 2 of The 3 Cases for TextArea P", forType: .string)

        KindaVimEngine.shared.lastYankStyle = .characterwise
        let accessibilityElement = sendMoveThroughVimEngineAndGetBackAccessibilityElement()

        XCTAssertEqual(accessibilityElement?.value, "you're out of the boundaries buddytest 2 of The 3 Cases for TextArea P")
        XCTAssertEqual(accessibilityElement?.caretLocation, 69)
    }

    func test_that_if_the_caret_is_at_the_last_character_of_the_TextArea_and_on_an_empty_line_it_still_pastes() {
        let textInAXFocusedElement = """
caret is on its
own empty
line

"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [])

        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 3 of The 3 Cases for TextArea P", forType: .string)

        KindaVimEngine.shared.lastYankStyle = .characterwise
        let accessibilityElement = sendMoveThroughVimEngineAndGetBackAccessibilityElement()

        XCTAssertEqual(accessibilityElement?.value, """
caret is on its
own empty
line
test 3 of The 3 Cases for TextArea P
"""
        )
        XCTAssertEqual(accessibilityElement?.caretLocation, 66)
    }

}


// characterwise
// other cases
extension UIASNM_P__TextViews_Tests {

    func test_that_in_normal_setting_it_pastes_the_text_at_the_caret_location_and_the_block_cursor_ends_up_at_the_end_of_the_pasted_text() {
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
inpastaing TextViews
ho ho ho
"""
        )
        XCTAssertEqual(accessibilityElement?.caretLocation, 23)
    }

    func test_that_pasting_on_an_empty_line_does_not_paste_on_a_line_above_but_stays_on_the_same_line_and_does_not_stick_with_the_next_line() {
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
// the 3 special cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
extension UIASNM_P__TextViews_Tests {

    func test_that_if_the_TextArea_is_empty_it_still_pastes_on_the_current_line_and_enforce_a_trailing_linefeed() {
        let textInAXFocusedElement = ""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()

        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 1 of The 3 Cases for TextArea linewise P", forType: .string)

        KindaVimEngine.shared.lastYankStyle = .linewise
        let accessibilityElement = sendMoveThroughVimEngineAndGetBackAccessibilityElement()

        XCTAssertEqual(accessibilityElement?.value, """
test 1 of The 3 Cases for TextArea linewise P

"""
        )
        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
    }

    func test_that_if_the_caret_is_at_the_last_character_of_the_TextArea_and_on_a_non_empty_line_it_still_pastes_and_will_enforce_a_trailing_linefeed() {
        let textInAXFocusedElement = """
end of boundaries
cannot
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [])

        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 2 of The 3 Cases for TextArea linewise P", forType: .string)

        KindaVimEngine.shared.lastYankStyle = .linewise
        let accessibilityElement = sendMoveThroughVimEngineAndGetBackAccessibilityElement()

        XCTAssertEqual(accessibilityElement?.value, """
end of boundaries
test 2 of The 3 Cases for TextArea linewise P
cannot
"""
        )
        XCTAssertEqual(accessibilityElement?.caretLocation, 18)
    }

    func test_that_if_the_caret_is_at_the_last_character_of_the_TextArea_and_on_an_empty_line_it_still_pastes_and_will_enforce_a_trailing_linefeed() {
        let textInAXFocusedElement = """
this should paste
on the last line and
enforce a linefeed

"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [])

        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 3 of The 3 Cases for TextArea linewise P", forType: .string)

        KindaVimEngine.shared.lastYankStyle = .linewise
        let accessibilityElement = sendMoveThroughVimEngineAndGetBackAccessibilityElement()

        XCTAssertEqual(accessibilityElement?.value, """
this should paste
on the last line and
enforce a linefeed
test 3 of The 3 Cases for TextArea linewise P

"""
        )
        XCTAssertEqual(accessibilityElement?.caretLocation, 58)
    }

}


// linewise
// other cases
extension UIASNM_P__TextViews_Tests {

    func test_that_in_normal_setting_it_pasts_the_content_on_the_current_line_and_shifts_the_current_line_down() {
        let textInAXFocusedElement = """
so if we use P
the current line is gonna
shift and thew new one is gonna be
pasted at the current line place
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])
        KindaVimEngine.shared.enterNormalMode()

        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("should paste that\n", forType: .string)

        KindaVimEngine.shared.lastYankStyle = .linewise
        let accessibilityElement = sendMoveThroughVimEngineAndGetBackAccessibilityElement()

        XCTAssertEqual(accessibilityElement?.value, """
so if we use P
the current line is gonna
should paste that
shift and thew new one is gonna be
pasted at the current line place
"""
        )
        XCTAssertEqual(accessibilityElement?.caretLocation, 41)

    }

    func test_that_when_pasting_the_new_line_the_block_cursor_goes_to_the_first_non_blank_of_the_new_current_line() {
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
   the copied line has non blanks
have to move the caret
to the first non blank of the copied line
"""
        )
        XCTAssertEqual(accessibilityElement?.caretLocation, 19)
    }

}
