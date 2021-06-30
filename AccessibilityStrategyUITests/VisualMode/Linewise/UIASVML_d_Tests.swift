import XCTest


class UIASVML_d_Tests: UIAS_BaseTests {
        
    private func applyMovesAndGetBackUpdatedElement() -> AccessibilityTextElement? {
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v, shift: true))
        
        return applyMoveAndGetBackUpdatedElement { focusedElement in
            asVisualMode.d(on: focusedElement)
        }
    }
    
}


// the 3 special cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
extension UIASVML_d_Tests {    
    
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


// linewise
extension UIASVML_d_Tests {
    
    func test_that_the_caret_will_go_to_the_first_non_blank_of_the_next_line_that_is_taking_over() {
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
    
    func test_that_the_caret_will_go_the_the_end_limit_of_the_next_line_if_the_next_line_is_just_made_of_spaces() {
        let textInAXFocusedElement = """
we gonna use VM
d here and we suppose
        
some more
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        
        let finalElement = applyMovesAndGetBackUpdatedElement()
        
        XCTAssertEqual(finalElement?.value, """
we gonna use VM
        
some more
"""
        )
        XCTAssertEqual(finalElement?.caretLocation, 23)    
    }
    
    func test_that_if_the_next_line_is_only_blanks_the_caret_goes_to_the_limit_of_the_line_before_the_linefeed() {
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
d here and we suppose
         
"""
        )
        XCTAssertEqual(finalElement?.caretLocation, 46)    
    }
    
    func test_that_removing_the_last_line_puts_the_caret_at_the_first_non_blank_of_the_previous_line() {
        let textInAXFocusedElement = """
   we gonna remove the last
line and caret should go up
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [])
        
        let finalElement = applyMovesAndGetBackUpdatedElement()
        
        XCTAssertEqual(finalElement?.value, """
   we gonna remove the last
"""
        )
        XCTAssertEqual(finalElement?.caretLocation, 3)    
    }
    
}
