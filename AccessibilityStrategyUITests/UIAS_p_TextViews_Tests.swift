@testable import kindaVim
import XCTest


// see UIAS_p_TextFields_Tests for blah blah
class UIAS_p_TextViews_Tests: UIAS_BaseTests {
    
    private func applyMoveAndGetBackUpdatedElement() -> AccessibilityTextElement? {
        return applyMoveAndGetBackUpdatedElement { focusedElement in 
            accessibilityStrategy.p(on: focusedElement)
        }
    }
    
}


// the 3 special cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
extension UIAS_p_TextViews_Tests {
    
    func test_that_if_the_TextArea_is_empty_it_still_pastes() {
        let textInAXFocusedElement = ""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 1 of The 3 Cases for TextArea", forType: .string)
                
        let finalElement = applyMoveAndGetBackUpdatedElement()
        
        XCTAssertEqual(finalElement?.value, "test 1 of The 3 Cases for TextArea")
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextArea_it_does_nothing_and_does_not_crash() {
        let textInAXFocusedElement = "the user has clicked out of the boundaries!"
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 2 of The 3 Cases for TextArea", forType: .string)
        
        let finalElement = applyMoveAndGetBackUpdatedElement()
        
        XCTAssertEqual(finalElement?.value, "the user has clicked out of the boundaries!")
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextArea_and_on_an_empty_line_it_still_pastes() {
        let textInAXFocusedElement = """
caret is on its
own empty
line

"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 3 of The 3 Cases for TextArea", forType: .string)
        
        let finalElement = applyMoveAndGetBackUpdatedElement()
        
        XCTAssertEqual(finalElement?.value, """
caret is on its
own empty
line
test 3 of The 3 Cases for TextArea
"""
        )
    }   

}


// TextViews
extension UIAS_p_TextViews_Tests {
    
    
    
}
