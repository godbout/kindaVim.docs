import XCTest


class UIASVML_k_Tests: UIAS_BaseTests {
    
    private func applyMovesAndGetBackUpdatedElement() -> AccessibilityTextElement? {
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v, shift: true))
        
        return applyMoveAndGetBackUpdatedElement { focusedElement in
            asVisualMode.k(on: focusedElement)
        }
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
        
        let finalElement = applyMovesAndGetBackUpdatedElement()        
        
        XCTAssertEqual(finalElement?.caretLocation, 0)
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_but_not_on_an_empty_line_it_works_and_selects_the_whole_last_line() {
        let textInAXFocusedElement = """
   caret is
gonna be at the end
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v, shift: true))        
        
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [.command])
        
        let finalElement = asVisualMode.k(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())
        
        XCTAssertEqual(finalElement?.caretLocation, 12)
        XCTAssertEqual(finalElement?.selectedLength, 19)
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_and_on_an_empty_line_it_works_and_does_not_move() {
        let textInAXFocusedElement = """
caret is on its
own empty
    line

"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        
        let finalElement = applyMovesAndGetBackUpdatedElement()
        
        XCTAssertEqual(finalElement?.caretLocation, 35)
    }
    
}


// TextFields
extension UIASVML_k_Tests {
    
    func test_that_in_TextFields_basically_it_does_nothing() {
        let textInAXFocusedElement = "hehe you little fucker"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])
        
        let finalElement = applyMovesAndGetBackUpdatedElement()        
        
        XCTAssertEqual(finalElement?.caretLocation, 0)
        XCTAssertEqual(finalElement?.selectedLength, 22)
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
        
        let finalElement = applyMovesAndGetBackUpdatedElement()
        
        XCTAssertEqual(finalElement?.caretLocation, 52)
        XCTAssertEqual(finalElement?.selectedLength, 43)
        
        let finalFinalElementHehe = asVisualMode.k(on: finalElement)
        
        XCTAssertEqual(finalFinalElementHehe?.caretLocation, 26)
        XCTAssertEqual(finalFinalElementHehe?.selectedLength, 69)        
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
        
        // need to call j so that the anchor and head get updated properly
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v, shift: true))        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .j))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .j))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .j))
        
        let finalElement = asVisualMode.k(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())
        
        XCTAssertEqual(finalElement?.caretLocation, 0)
        XCTAssertEqual(finalElement?.selectedLength, 75)
        
        let finalFinalElementHehe = asVisualMode.k(on: finalElement)
        
        XCTAssertEqual(finalFinalElementHehe?.caretLocation, 0)
        XCTAssertEqual(finalFinalElementHehe?.selectedLength, 51)      
    }
    
}
