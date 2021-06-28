import XCTest


class UIASVM_c_Tests: UIAS_BaseTests {
    
    private func applyMovesAndGetBackUpdatedElement() -> AccessibilityTextElement? {
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v, shift: true))
        
        return applyMoveAndGetBackUpdatedElement { focusedElement in
            asVisualMode.c(on: focusedElement)
        }
    }
    
}


// linewise
extension UIASVM_c_Tests {
    
    func test_that_the_line_gets_deleted_until_the_linefeed_and_the_caret_ends_up_at_the_beginning_of_that_line() {    
        let textInAXFocusedElement = """
we gonna use VM
d here and we suppose
      to go to non blank of the line
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])  
        
        let finalElement = applyMovesAndGetBackUpdatedElement()
        
        XCTAssertEqual(finalElement?.value, """
we gonna use VM

      to go to non blank of the line
"""
        )
        XCTAssertEqual(finalElement?.caretLocation, 16)        
    }
        
}
