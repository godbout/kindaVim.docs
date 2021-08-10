import XCTest


class ASUI_VMC_G__Tests: ASUI_VM_BaseTests {}


// Both
extension ASUI_VMC_G__Tests {

    func test_that_if_the_TextElement_is_just_one_line_and_the_head_is_before_the_anchor_then_the_selection_goes_from_the_anchor_to_the_first_non_blank_of_the_line() {
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
