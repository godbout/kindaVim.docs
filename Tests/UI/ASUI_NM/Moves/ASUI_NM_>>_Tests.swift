@testable import kindaVim
import KeyCombination
import XCTest


// see << for blah blah of why those tests are quite special
class ASUI_NM_rightChevronRightChevron_Tests: ASUI_NM_BaseTests {
    
    private func applyMoveAndGetBackAccessibilityElement() -> AccessibilityTextElement? {
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .rightChevron))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .rightChevron))
        
        return AccessibilityTextElementAdaptor.fromAXFocusedElement()
    }
    
}


// Both
extension ASUI_NM_rightChevronRightChevron_Tests {
    
    func test_that_in_normal_setting_it_adds_4_spaces_at_the_beginning_of_a_line_and_sets_the_caret_to_the_first_non_blank_of_the_line() {
        let textInAXFocusedElement = """
seems that even the normal
🖕️ase fails LMAO
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()
            
        XCTAssertEqual(accessibilityElement?.caretLocation, 31)
        XCTAssertEqual(accessibilityElement?.selectedLength, 3)
    }
    
    func test_that_it_does_not_shift_the_line_if_the_line_is_considered_empty() {
        let textInAXFocusedElement = """
a line empty means with nothing

or just a linefeed
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .k))
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 32)
        XCTAssertEqual(accessibilityElement?.selectedLength, 1)
    }
    
}
