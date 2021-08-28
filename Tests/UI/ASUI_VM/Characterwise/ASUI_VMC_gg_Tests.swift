import KeyCombination
import XCTest


class ASUI_VMC_gg_Tests: ASUI_VM_BaseTests {}


// Both
extension ASUI_VMC_gg_Tests {
    
    // see G for blah blah!
    func test_that_if_the_new_head_location_is_after_the_anchor_then_it_selects_from_the_anchor_to_the_new_head_location() {
        let textInAXFocusedElement = "        so here we gonna test vgg"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .zero))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .l))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .g))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .g))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 1)
        XCTAssertEqual(accessibilityElement?.selectedLength, 8)
    }
    
}


// TextViews
extension ASUI_VMC_gg_Tests {

    func test_that_if_the_new_head_location_is_before_the_anchor_then_it_selects_from_anchor_to_the_new_head_location() {
        let textInAXFocusedElement = """
    we gonna put the caret
way after the new head location
and it's gonna run smooooooooooooth
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .k))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .b))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .b))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .g))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .g))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 4)
        XCTAssertEqual(accessibilityElement?.selectedLength, 42)
    }
    
}
