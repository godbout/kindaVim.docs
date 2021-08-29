import XCTest
import KeyCombination
import AccessibilityStrategy


class ASUI_VMC_G__Tests: ASUI_VM_BaseTests {}


// Both
extension ASUI_VMC_G__Tests {

    // this only happens if the new head location and the anchor are on the same line!
    func test_that_if_the_new_head_location_is_before_the_anchor_then_it_selects_from_the_new_head_location_until_the_anchor() {
        let textInAXFocusedElement = "        so here we gonna test vG"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .b))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .b))
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .G))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 8)
        XCTAssertEqual(accessibilityElement?.selectedLength, 23)
    }

}


// TextViews
extension ASUI_VMC_G__Tests {
    
    func test_that_if_the_new_head_location_is_after_the_anchor_then_it_selects_from_anchor_to_the_new_head_location() {
        let textInAXFocusedElement = """
we gonna put the caret before
the anchor and do
the move and it should
     all work fine
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .k))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .k))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .k))
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .G))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 46)
        XCTAssertEqual(accessibilityElement?.selectedLength, 31)
    }
    
}
