@testable import kindaVim
import XCTest
import KeyCombination
import AccessibilityStrategy


class UIASNM_G__Tests: ASUI_NM_BaseTests {
    
    private func applyMoveAndGetBackAccessibilityElement() -> AccessibilityTextElement? {
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .G))
        
        return AccessibilityTextElementAdaptor.fromAXFocusedElement()
    }
    
}


// TextFields
extension UIASNM_G__Tests {
    
    func test_that_it_goes_to_the_beginning_of_the_line_if_it_starts_with_non_blank() {
        let textInAXFocusedElement = "a normal sentence for G"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
    }
    
    func test_that_it_goes_to_the_first_non_blank_of_the_line() {
        let textInAXFocusedElement = "      🍆️ should go to well 🍆️"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 6)
        XCTAssertEqual(accessibilityElement?.selectedLength, 3)
    }
    
    func test_that_it_goes_to_the_end_limit_of_the_line_if_there_is_no_non_blank() {
        let textInAXFocusedElement = "         "
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 8)
    }
    
}


// TextViews
extension UIASNM_G__Tests {
    
    func test_that_it_goes_to_the_first_character_of_the_last_line_of_the_TextView_if_that_line_starts_with_non_blank() {
        let textInAXFocusedElement = """
hehehe
do you want to
have xxx
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 22)
    }
    
    func test_that_it_goes_to_the_first_non_blank_of_the_last_line_of_the_TextView() {
        let textInAXFocusedElement = """
 that's another
story bro
   and it's not easy
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 29)
    }
    
    func test_that_it_works_with_an_empty_last_line() {
        let textInAXFocusedElement = """
last line is
completely empty

"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        KindaVimEngine.shared.enterNormalMode()
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 30)
    }
    
    func test_that_it_stops_at_the_end_limit_when_the_last_line_is_just_spaces() {
        let textInAXFocusedElement = """
fucking loads of spaces
again at the last line
             
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 59)
    }
    
    func test_that_if_the_last_line_is_not_empty_and_the_caret_is_not_on_that_line_then_the_caret_still_goes_to_the_last_line_and_does_not_get_stuck_on_the_current_line() {
        let textInAXFocusedElement = """
caret seems stuck
to the line it is
why
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [.command])
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [.option])
        KindaVimEngine.shared.enterNormalMode()
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 36)
    }
    
}
