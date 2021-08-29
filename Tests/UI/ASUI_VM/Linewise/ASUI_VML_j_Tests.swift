import XCTest
import KeyCombination
import AccessibilityStrategy


class ASUI_VML_j_Tests: ASUI_VM_BaseTests {
    
    private func applyMoveAndGetBackAccessibilityElement() -> AccessibilityTextElement? {
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .j))
        
        return AccessibilityTextElementAdaptor.fromAXFocusedElement()
    }
    
}


// TextFields
extension ASUI_VML_j_Tests {
    
    func test_that_in_TextFields_basically_it_does_nothing() {
        let textInAXFocusedElement = "hehe you little fucker"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])
        KindaVimEngine.shared.enterNormalMode()
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()        
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
        XCTAssertEqual(accessibilityElement?.selectedLength, 22)
    }
    
}

// TODO
//
//// TextViews
//extension ASUI_VML_j_Tests {
//    
//    // we go down twice coz once worked but twice didn't hehe :))
//    func test_that_if_the_head_is_after_the_anchor_then_it_extends_the_selection_by_one_line_below_at_a_time() {
//        let textInAXFocusedElement = """
//so pressing j in
//Visual Mode is gonna be
//cool because it will extend
//the selection
//when the head is after the anchor
//"""
//        app.textViews.firstMatch.tap()
//        app.textViews.firstMatch.typeText(textInAXFocusedElement)
//        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [.command])
//        KindaVimEngine.shared.enterNormalMode()
//        
//        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()
//        
//        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
//        XCTAssertEqual(accessibilityElement?.selectedLength, 41)
//        
//        let finalaccessibilityElementHehe = asVisualMode.j(on: accessibilityElement)
//        
//        XCTAssertEqual(finalaccessibilityElementHehe?.caretLocation, 0)
//        XCTAssertEqual(finalaccessibilityElementHehe?.selectedLength, 69)        
//    }
//    
//    func test_that_if_the_head_is_before_the_anchor_then_it_reduces_the_selection_by_one_line_below_at_a_time() {
//        let textInAXFocusedElement = """
//so pressing j in
//Visual Mode is gonna be
//cool because it will reduce
//the selection when the
//head if before the anchor
//"""
//        app.textViews.firstMatch.tap()
//        app.textViews.firstMatch.typeText(textInAXFocusedElement)
//        KindaVimEngine.shared.enterNormalMode()
//        
//        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))
//        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .k))
//        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .k))
//        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .k))
//        
//        let accessibilityElement = asVisualMode.j(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())
//                
//        XCTAssertEqual(accessibilityElement?.caretLocation, 41)
//        XCTAssertEqual(accessibilityElement?.selectedLength, 76)
//        
//        let finalaccessibilityElementHehe = asVisualMode.j(on: accessibilityElement)
//        
//        XCTAssertEqual(finalaccessibilityElementHehe?.caretLocation, 69)
//        XCTAssertEqual(finalaccessibilityElementHehe?.selectedLength, 48)        
//    }
//    
//    func test_that_it_does_not_skip_empty_lines() {
//        let textInAXFocusedElement = """
//wow that one is
//
//ass off lol
//"""
//        app.textViews.firstMatch.tap()
//        app.textViews.firstMatch.typeText(textInAXFocusedElement)
//        KindaVimEngine.shared.enterNormalMode()
//        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .g))
//        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .g))
//        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))
//        
//        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .j))
//        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
//        
//        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
//        XCTAssertEqual(accessibilityElement?.selectedLength, 17)
//    }
//    
//}


// emojis
// from what i see, no emojis issues with Linewise
extension ASUI_VML_j_Tests {}
