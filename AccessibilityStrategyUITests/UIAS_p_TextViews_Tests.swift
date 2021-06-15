@testable import kindaVim
import XCTest


// p for TextViews is special bis
// the pasting style will depend on how the last yanking was made
// if it was characterwise, pasting paste in line
// if it was linewise, pasting paste on a new line below
class UIAS_p_TextViews_Tests: UIAS_BaseTests {
    
    private func sendMoveThroughVimEngineAndGetBackUpdatedFocusedElement() -> AccessibilityTextElement? {
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .p))
        
        return AccessibilityTextElementAdaptor.fromAXFocusedElement()        
    }   
    
}


// the 3 special cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
extension UIAS_p_TextViews_Tests {
    
    func test_that_if_the_TextArea_is_empty_it_still_pastes() {
        let textInAXFocusedElement = ""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 1 of The 3 Cases for TextArea", forType: .string)
                
        let finalElement = sendMoveThroughVimEngineAndGetBackUpdatedFocusedElement()
        
        
        XCTAssertEqual(finalElement?.value, "test 1 of The 3 Cases for TextArea")
        XCTAssertEqual(finalElement?.caretLocation, 33)
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextArea_it_does_nothing_and_does_not_crash() {
        let textInAXFocusedElement = "the user has clicked out of the boundaries!"
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 2 of The 3 Cases for TextArea", forType: .string)
        
        let finalElement = sendMoveThroughVimEngineAndGetBackUpdatedFocusedElement()
        
        XCTAssertEqual(finalElement?.value, "the user has clicked out of the boundaries!")
        XCTAssertEqual(finalElement?.caretLocation, 42)
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextArea_and_on_an_empty_line_it_still_pastes() {
        let textInAXFocusedElement = """
caret is on its
own empty
line

"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 3 of The 3 Cases for TextArea", forType: .string)
        
        let finalElement = sendMoveThroughVimEngineAndGetBackUpdatedFocusedElement()
        
        XCTAssertEqual(finalElement?.value, """
caret is on its
own empty
line
test 3 of The 3 Cases for TextArea
"""
        )
        XCTAssertEqual(finalElement?.caretLocation, 64)
    }   

}


// TextViews
extension UIAS_p_TextViews_Tests {
    
    func test_that_if_not_on_last_line_and_the_last_yanking_style_was_linewise_it_pastes_the_content_on_a_new_line_below() {        
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
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("should paste that somewhere\n", forType: .string)
        
        VimEngine.shared.lastYankStyle = .linewise
        let finalElement = sendMoveThroughVimEngineAndGetBackUpdatedFocusedElement()
        
        XCTAssertEqual(finalElement?.value, """
we gonna linewise paste
on a line that is not
the last so there's already
should paste that somewhere
a linefeed at the end of the line
"""
        )
        XCTAssertEqual(finalElement?.caretLocation, 74)
    }
    
    func test_that_if_on_last_line_and_the_last_yanking_style_was_linewise_it_pastes_the_content_on_a_new_line_below() {
        let textInAXFocusedElement = """
now we gonna linewise paste
after the last line
so we need to add the linefeed
ourselves
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [])
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("new line to paste after last line\n", forType: .string)
        
        VimEngine.shared.lastYankStyle = .linewise
        let finalElement = sendMoveThroughVimEngineAndGetBackUpdatedFocusedElement()
        
        XCTAssertEqual(finalElement?.value, """
now we gonna linewise paste
after the last line
so we need to add the linefeed
ourselves
new line to paste after last line

"""
        )
        XCTAssertEqual(finalElement?.caretLocation, 89)
    }
    
}
