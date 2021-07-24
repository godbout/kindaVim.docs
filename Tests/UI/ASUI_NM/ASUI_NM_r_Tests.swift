@testable import kindaVim
import XCTest


class ASUI_NM_r_Tests: ASUI_NM_BaseTests {}


extension ASUI_NM_r_Tests {
    

    // TextFields
    func test_that_in_normal_setting_it_replaces_the_character_under_the_cursor_with_the_one_given() {
        let textInAXFocusedElement = "gonna replace one of those letters..."
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [])
        KindaVimEngine.shared.enterNormalMode()
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .r))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .a))
        
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.value, "gonna replace one of thosa letters...")
        XCTAssertEqual(accessibilityElement?.caretLocation, 25)
        XCTAssertEqual(accessibilityElement?.selectedLength, 1)
    }

    func test_that_it_can_replace_a_letter_by_a_space() {
        let textInAXFocusedElement = "i need more space!"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .r))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .space))
        
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.value, "i need more space ")
        XCTAssertEqual(accessibilityElement?.caretLocation, 17)
        XCTAssertEqual(accessibilityElement?.selectedLength, 1)
    }

}


// TextViews
extension ASUI_NM_r_Tests {
    
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


// emojis
extension ASUI_NM_r_Tests {
    
    func test_that_it_handles_emojis() {
        let textInAXFocusedElement = """
need to deal with
e💨️💨️💨️ fac"es 🥺️☹️😂️ h😀️ha👅️" hhohohoo🤣️
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [.command])
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .l))
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .r))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .nine))
        
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.value, """
need to deal with
e9💨️💨️ fac"es 🥺️☹️😂️ h😀️ha👅️" hhohohoo🤣️
"""
        )
        XCTAssertEqual(accessibilityElement?.caretLocation, 19)
        XCTAssertEqual(accessibilityElement?.selectedLength, 1)
    }
    
}
