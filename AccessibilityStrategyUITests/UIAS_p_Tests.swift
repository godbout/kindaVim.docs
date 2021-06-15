@testable import kindaVim
import XCTest


// so p is a special one too because it sets the selectedText, and maybe
// move back the block cursor after. so we need to do a lot of tests through UI.
// some other tests that can do before hitting the ATEAdaptor are tested in the
// normal Unit Tests for p. this should cover it all.
// also we need to separate TextFields from TextViews tests because they will
// indeed behave differently: we will never paste linewise in TextFields
class UIAS_p_Tests: UIAS_BaseTests {
    
    private func applyMoveAndGetBackUpdatedElement() -> AccessibilityTextElement? {
        return applyMoveAndGetBackUpdatedElement { focusedElement in 
            accessibilityStrategy.p(on: focusedElement)
        }
    }
    
}


// TextFields
extension UIAS_p_Tests {
    
    // the 3 special cases, but only 2 for TextFields
    // as the last one doesn't apply
    // - empty TextElement
    // - caret at the end of TextElement but not on empty line
    func test_that_if_the_TextField_is_empty_it_still_pastes() {
        let textInAXFocusedElement = ""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
                
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 1 of The 3 Cases", forType: .string)
        
        // so that we get the h move, hence the correct location
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .p))

        let finalElement = applyMoveAndGetBackUpdatedElement()
        
        XCTAssertEqual(finalElement?.value, "test 1 of The 3 Cases")
        XCTAssertEqual(finalElement?.caretLocation, 20)
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextField_it_does_nothing_and_does_not_crash() {
        let textInAXFocusedElement = "the user has clicked out of the boundaries!"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 2 of The 3 Cases", forType: .string)
        
        // so that we get the h move, hence the correct location
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .p))
        
        let finalElement = applyMoveAndGetBackUpdatedElement()
        
        XCTAssertEqual(finalElement?.value, "the user has clicked out of the boundaries!")
        XCTAssertEqual(finalElement?.caretLocation, 42)
    }

}
