import XCTest


class UIASVMC_d_Tests: UIAS_BaseTests {
    
    private func applyMovesAndGetBackUpdatedElement() -> AccessibilityTextElement? {
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        
        return applyMoveAndGetBackUpdatedElement { focusedElement in
            asVisualMode.d(on: focusedElement)
        }
    }
    
}


// the 3 special cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
extension UIASVMC_d_Tests {    
    
    func test_that_if_the_TextElement_is_empty_it_works_and_deletes_NOTHING() {
        let textInAXFocusedElement = ""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        
        let finalElement = applyMovesAndGetBackUpdatedElement()        
        
        XCTAssertEqual(finalElement?.caretLocation, 0)
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_but_not_on_an_empty_line_it_works_and_the_caret_goes_to_the_relevant_position() {
        let textInAXFocusedElement = """
   caret is
gonna be at the end
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        
        let finalElement = applyMovesAndGetBackUpdatedElement()
        
        XCTAssertEqual(finalElement?.value, """
   caret is
"""
        )
        XCTAssertEqual(finalElement?.caretLocation, 3)
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_and_on_an_empty_line_it_works_and_the_caret_goes_to_the_relevant_position() {
        let textInAXFocusedElement = """
caret is on its
own empty
    line

"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        
        let finalElement = applyMovesAndGetBackUpdatedElement()
        
        XCTAssertEqual(finalElement?.value, """
caret is on its
own empty
    line
"""
        )
        XCTAssertEqual(finalElement?.caretLocation, 30)
    }
    
}


extension UIASVMC_d_Tests {
    
    func test_that_it_simply_deletes_the_selection() {
        let textInAXFocusedElement = """
all that VM d does
in characterwise is deleting
the selection!
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [.shift, .command])
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [.option, .shift])
        
        let finalElement = asVisualMode.d(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())
        _ = AccessibilityTextElementAdaptor.toAXfocusedElement(from: finalElement!)
        
        let finalFinalElementHehe = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(finalFinalElementHehe?.value, """
all that VM d ise is deleting
the selection!
"""
        )
        XCTAssertEqual(finalFinalElementHehe?.caretLocation, 14)        
    }
    
}
