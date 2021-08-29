import XCTest
import KeyCombination
import AccessibilityStrategy


class ASUI_VML_gg_Tests: ASUI_VM_BaseTests {}


// Both
extension ASUI_VML_gg_Tests {
    
    func test_that_if_the_TextElement_is_just_a_single_line_then_it_keeps_the_whole_line_selected() {
        let textInAXFocusedElement = "        so here we gonna test Vgg"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .g))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .g))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
        XCTAssertEqual(accessibilityElement?.selectedLength, 33)
    }
    
}


// TextViews
extension ASUI_VML_gg_Tests {

    func test_that_if_the_head_is_after_the_line_of_the_anchor_then_it_selects_from_the_anchor_to_the_beginning_of_the_text() {
        let textInAXFocusedElement = """
so now this is gonna
😂️ be a longer one
and we're gonna
select until
the end
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .k))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .k))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .j))
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .g))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .g))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
        XCTAssertEqual(accessibilityElement?.selectedLength, 57)
    }
    
    func test_that_if_the_head_is_before_or_at_the_same_line_as_the_anchor_then_it_selects_from_the_anchor_to_the_beginning_of_the_text() {
        let textInAXFocusedElement = """
so now this is gonna
😂️ be a longer one
and we're gonna
select until
the end
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .k))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .k))
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .g))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .g))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
        XCTAssertEqual(accessibilityElement?.selectedLength, 70)
    }
    
}
