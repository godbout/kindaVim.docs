@testable import kindaVim
import XCTest


// those UI tests are testing that we shift correctly the content of a line. those func
// are used by NM << >> and VM < >
class ASUI_NM_shiftCurrentLine4SpacesToTheLeft_Tests: ASUI_NM_BaseTests {
    
    private func applyMoveAndGetBackAccessibilityElement() -> AccessibilityTextElement? {
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .leftChevron))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .leftChevron))
        
        return AccessibilityTextElementAdaptor.fromAXFocusedElement()
    }
    
}


// Both
extension ASUI_NM_shiftCurrentLine4SpacesToTheLeft_Tests {
    
    func test_that_in_normal_setting_it_removes_4_spaces_at_the_beginning_of_a_line_and_sets_the_caret_to_the_first_non_blank_of_the_line() {
        let textInAXFocusedElement = """
seems that even the normal
       🖕️ase fails LMAO
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.value, """
seems that even the normal
   🖕️ase fails LMAO
"""
        )        
    }
    
    func test_that_it_removes_all_the_spaces_if_there_are_4_or_less() {
        let textInAXFocusedElement = """
 now the line
  😀️as just two
 spaces
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .k))
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.value, """
 now the line
😀️as just two
 spaces
"""
        )
    }
    
}
