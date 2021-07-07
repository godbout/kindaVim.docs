import XCTest


class UIASVML_k_Tests: UIAS_BaseTests {
    
    private func applyMoveAndGetBackAccessibilityElement() -> AccessibilityTextElement? {
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .k))
        
        return AccessibilityTextElementAdaptor.fromAXFocusedElement()
    }
    
}


// The 3 Cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
extension UIASVML_k_Tests {    
    
    func test_that_if_the_TextElement_is_empty_it_works_and_does_not_move() {
        let textInAXFocusedElement = ""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        VimEngine.shared.enterNormalMode()
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()        
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_but_not_on_an_empty_line_it_works_and_selects_the_whole_last_line() {
        let textInAXFocusedElement = """
   caret is
gonna be at the end
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        VimEngine.shared.enterNormalMode()
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [])
        
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))        
        
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [.command])
        
        let accessibilityElement = asVisualMode.k(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 12)
        XCTAssertEqual(accessibilityElement?.selectedLength, 19)
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_and_on_an_empty_line_it_works_and_does_not_move() {
        let textInAXFocusedElement = """
caret is on its
own empty
    line

"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        VimEngine.shared.enterNormalMode()
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [])
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 35)
    }
    
}


// TextFields
extension UIASVML_k_Tests {
    
    func test_that_in_TextFields_basically_it_does_nothing() {
        let textInAXFocusedElement = "hehe you little fucker"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])
        VimEngine.shared.enterNormalMode()
        
        VimEngine.shared.enterNormalMode()        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()        
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
        XCTAssertEqual(accessibilityElement?.selectedLength, 22)
    }
    
}


// TextViews
extension UIASVML_k_Tests {

    func test_that_if_the_head_is_before_the_anchor_then_it_extends_the_selection_by_one_line_above_at_a_time() {
        let textInAXFocusedElement = """
so pressing k if the head
is before the anchor will
extend the selection to
the line above nice
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        VimEngine.shared.enterNormalMode()
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 52)
        XCTAssertEqual(accessibilityElement?.selectedLength, 43)
        
        let finalaccessibilityElementHehe = asVisualMode.k(on: accessibilityElement)
        
        XCTAssertEqual(finalaccessibilityElementHehe?.caretLocation, 26)
        XCTAssertEqual(finalaccessibilityElementHehe?.selectedLength, 69)        
    }
    
    func test_that_if_the_head_is_after_the_anchor_then_it_reduces_the_selection_by_one_line_above_at_a_time() {
        let textInAXFocusedElement = """
so pressing k if the head
is after the anchor will
reduce the selection to
the line above nice
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [.command])
        VimEngine.shared.enterNormalMode()
        
        // need to call j so that the anchor and head get updated properly
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .j))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .j))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .j))
        
        let accessibilityElement = asVisualMode.k(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
        XCTAssertEqual(accessibilityElement?.selectedLength, 75)
        
        let finalaccessibilityElementHehe = asVisualMode.k(on: accessibilityElement)
        
        XCTAssertEqual(finalaccessibilityElementHehe?.caretLocation, 0)
        XCTAssertEqual(finalaccessibilityElementHehe?.selectedLength, 51)      
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_and_on_an_empty_line_it_does_not_get_stuck_when_trying_to_move_up_and_selects_the_line_above() {
        let textInAXFocusedElement = """
we gonna place the
caret at the last empty line

"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        VimEngine.shared.enterNormalMode()
        
        // need to call j so that the anchor and head get updated properly
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .k))
        
        let accessibilityElement = asVisualMode.k(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 19)
        XCTAssertEqual(accessibilityElement?.selectedLength, 29)
    }
    
}
