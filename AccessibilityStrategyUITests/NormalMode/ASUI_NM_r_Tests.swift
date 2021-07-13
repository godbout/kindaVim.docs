@testable import kindaVim
import XCTest


class UIASNM_r_Tests: UIAS_BaseTests {}


// TextViews
extension UIASNM_r_Tests {
    
    func test_that_replacing_a_character_by_a_linefeed_sets_the_cursor_at_the_first_column_of_the_new_created_line() {
        let textInAXFocusedElement = """
gonna replace something
by
a new line
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        KindaVimEngine.shared.enterNormalMode()
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .r))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .enter))
        
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.value, """
gonna replace something
b

a new line
"""
        )
        XCTAssertEqual(accessibilityElement?.caretLocation, 26)
    }
    
    func test_that_cancelling_the_replacement_by_giving_escape_does_not_move_the_caret_backwards() {
        let textInAXFocusedElement = """
now we gonna start the replacement
move but cancel it with
escape
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .r))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .escape))
        
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.value, """
now we gonna start the replacement
move but cancel it with
escape
"""
        )
        XCTAssertEqual(accessibilityElement?.caretLocation, 64)        
    }
    
}
