import XCTest


class UIASVM_j_Linewise_Tests: UIAS_BaseTests {
    
    private func applyMovesAndGetBackUpdatedElement() -> AccessibilityTextElement? {
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v, shift: true))
        
        return applyMoveAndGetBackUpdatedElement { focusedElement in
            asVisualMode.j(on: focusedElement)
        }
    }
    
}


// The 3 Cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
extension UIASVM_j_Linewise_Tests {    
    
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
                
        let finalElement = asVisualMode.j(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())
        
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
extension UIASVM_j_Linewise_Tests {
    
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
extension UIASVM_j_Linewise_Tests {
    
    // we go down twice coz once work but twice didn't hehe :))
    func test_that_in_normal_setting_it_extends_the_selection_to_the_whole_line_below() {
        let textInAXFocusedElement = """
so pressing j in
Visual Mode is gonna be
cool because it will select
lines below
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [.command])
        
        let finalElement = applyMovesAndGetBackUpdatedElement()
        
        XCTAssertEqual(finalElement?.caretLocation, 0)
        XCTAssertEqual(finalElement?.selectedLength, 41)
        
        let finalFinalElementHehe = asVisualMode.j(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())
        
        XCTAssertEqual(finalFinalElementHehe?.caretLocation, 0)
        XCTAssertEqual(finalFinalElementHehe?.selectedLength, 69)        
    }
    
    
}
