@testable import kindaVim
import XCTest
import KeyCombination
import AccessibilityStrategy


class UIASNM_x_Tests: ASUI_NM_BaseTests {
    
    private func applyMoveAndGetBackAccessibilityElement() -> AccessibilityTextElement? {
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .x))
        
        return AccessibilityTextElementAdaptor.fromAXFocusedElement()
    }
    
}


// TextViews
extension UIASNM_x_Tests {
        
    func test_that_if_the_caret_is_at_the_last_character_of_a_line_that_does_not_end_with_a_linefeed_it_deletes_the_last_character_and_goes_back_one_character() {
        let textInAXFocusedElement = """
so we're on the last
character of the last line
that is not an empty line🤡️🤡️
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()        
        
        XCTAssertEqual(accessibilityElement?.value, """
so we're on the last
character of the last line
that is not an empty line🤡️
"""
        )
        XCTAssertEqual(accessibilityElement?.caretLocation, 73)
        XCTAssertEqual(accessibilityElement?.selectedLength, 3)
    }
    
    func test_that_if_the_caret_is_on_an_empty_line_it_does_not_delete_the_linefeed() {
        let textInAXFocusedElement = """
next line is gonna be empty!

but shouldn't be deleted
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        KindaVimEngine.shared.enterNormalMode()
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()        
        
        XCTAssertEqual(accessibilityElement?.value, """
next line is gonna be empty!

but shouldn't be deleted
"""
        )
        XCTAssertEqual(accessibilityElement?.caretLocation, 29)
    }
    
    func test_that_if_it_deletes_the_last_standing_character_of_a_line_it_does_not_jump_to_the_previous_line() {
        let textInAXFocusedElement = """
shouldn't jump up on this line!
☀️
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()        
        
        XCTAssertEqual(accessibilityElement?.value, """
shouldn't jump up on this line!

"""
        )
        XCTAssertEqual(accessibilityElement?.caretLocation, 32)
    }
    
    func test_that_it_should_not_suck_the_next_line() {
        let textInAXFocusedElement = """
💥️
x
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [.command])
        KindaVimEngine.shared.enterNormalMode()
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()        
        
        XCTAssertEqual(accessibilityElement?.value, """

x
"""
        )
        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
    }
    
}
