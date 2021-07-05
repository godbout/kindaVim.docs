@testable import kindaVim
import XCTest


class UIASNM_dj_tests: UIAS_BaseTests {
    
    private func applyMoveAndGetBackAccessibilityElement() -> AccessibilityTextElement? {
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .d))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .j))
        
        return AccessibilityTextElementAdaptor.fromAXFocusedElement()
    }
    
}


// Both
extension UIASNM_dj_tests {
    
    func test_that_if_there_is_only_one_line_it_does_not_do_anything() {
        let textInAXFocusedElement = "one line is not enough for dj"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        VimEngine.shared.enterNormalMode()       
        
        let finalElement = applyMoveAndGetBackAccessibilityElement()
        
        XCTAssertEqual(finalElement?.value, "one line is not enough for dj")        
        XCTAssertEqual(finalElement?.caretLocation, 28)
    }    
    
}


// TextViews
extension UIASNM_dj_tests {
    
    func test_that_it_can_delete_two_lines() {
        let textInAXFocusedElement = """
like this line and the following
one should disappear
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])      
        VimEngine.shared.enterNormalMode()       
        
        let finalElement = applyMoveAndGetBackAccessibilityElement()
        
        XCTAssertEqual(finalElement?.value, "")        
        XCTAssertEqual(finalElement?.caretLocation, 0)
    }
    
    func test_that_if_there_are_more_than_two_lines_the_caret_goes_to_the_first_non_blank_of_the_third_line() {
        let textInAXFocusedElement = """
now this is getting cool
because it will go to the next
     non blank of this line
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [.command])
        VimEngine.shared.enterNormalMode()       
        
        let finalElement = applyMoveAndGetBackAccessibilityElement()
        
        XCTAssertEqual(finalElement?.value, """
     non blank of this line
"""
        )        
        XCTAssertEqual(finalElement?.caretLocation, 5)
    }
    
}

