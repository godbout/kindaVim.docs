import XCTest


// check b for blah blah blah
class UIASVMC_e_Tests: UIAS_BaseTests {}


extension UIASVMC_e_Tests {
    
    func test_that_when_we_reach_the_anchor_and_will_reverse_anchor_and_head_the_e_move_does_not_block_and_moves_properly() {
        let textInAXFocusedElement = """
in Visual Mode Characterwise we
always move from the anchor, not
from the caret location
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)        
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .b))
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .e))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 54)
        XCTAssertEqual(accessibilityElement?.selectedLength, 5)
    }  
    
    func test_that_the_head_is_getting_updated_properly() {
        let textInAXFocusedElement = "we have to updated caretLocation before selectedLength!"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)        
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .zero))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .e))
        
        XCTAssertEqual(AccessibilityStrategyVisualMode.head, 1)
    }
    
}
