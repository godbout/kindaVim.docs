@testable import kindaVim
import XCTest


// see ci" for blah blah 
// plus we don't test ci[, ci{ and ci)]} because in KVE it's copy/pasted
// and the UI Tests are expensive :(
// also we have another test that checks that we position the caret properly in a special
// case where we follow autoindentation and first non blank blah blah. currently only this
// part of the move is calling lineFor, which requires a UI Test.
class UIASNM_ciLeftParenthesis_Tests: ASUI_NM_BaseTests {
    
    private func applyMoveAndGetBackAccessibilityElement() -> AccessibilityTextElement? {
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .c))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .i))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .leftParenthesis))
        
        return AccessibilityTextElementAdaptor.fromAXFocusedElement()
    }
    
}


// Both
extension UIASNM_ciLeftParenthesis_Tests {
    
    func test_that_in_normal_setting_it_can_delete_the_content_between_brackets() {
        let textInAXFocusedElement = """
hehe (
some bs
some more
)
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .F))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .y))
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.value, """
hehe (

)
"""
        )
    }
    
    func test_that_in_normal_setting_it_succeeds_and_switches_to_insert_mode() {
        let textInAXFocusedElement = """
hoho ( another pile of shit )
"""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .b))
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .c))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .i))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .leftParenthesis))
        
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .insert)
    }
    
    func test_a_case_where_it_should_not_delete_the_content_and_then_stay_in_normal_mode() {
        let textInAXFocusedElement = """
hoho no bracket on that shit
"""                
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)                
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])
        KindaVimEngine.shared.enterNormalMode()
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .c))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .i))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .leftParenthesis))
        
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
    
    func test_that_in_the_case_where_it_leaves_an_empty_line_between_the_brackets_it_positions_the_cursor_according_to_the_first_non_blank_of_the_first_line_that_is_after_the_opening_bracket() {
        let textInAXFocusedElement = """
now that shit will get cleaned (
    and the non blank
  will be respected!
)
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)                
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .k))
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.value, """
now that shit will get cleaned (
    
)
"""
        )
        XCTAssertEqual(accessibilityElement?.caretLocation, 37)
    }
    
}
