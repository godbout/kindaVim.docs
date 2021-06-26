import XCTest


class UIASVM_d_Tests: UIAS_BaseTests {
        
    private func applyMovesAndGetBackUpdatedElement() -> AccessibilityTextElement? {
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v, shift: true))
        
        return applyMoveAndGetBackUpdatedElement { focusedElement in
            asVisualMode.d(on: focusedElement)
        }
    }
    
}


// linewise
extension UIASVM_d_Tests {
    
    func test_that_in_linewise_the_caret_will_go_to_the_first_non_blank_of_the_next_line_taking_over() {
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
        XCTAssertEqual(finalElement?.caretLocation, 22)        
    }
}
