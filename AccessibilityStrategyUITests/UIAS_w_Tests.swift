@testable import kindaVim
import XCTest

class UIAS_w_Tests: UIAS_BaseTests {}

// TextViews
extension UIAS_w_Tests {
    
    func test_that_it_does_update_the_globalColumnNumber_correctly() {
        let textInAXFocusedElement = """
this is to make
sure that when the move
changes line then
the globalColumnNumber
gets updated properly
"""
        
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        
        // need to move the caretLocation to have a proper AccessibilityTextElement.globalColumnNumber
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .w))
        
        XCTAssertEqual(AccessibilityTextElement.globalColumnNumber, 1)
    }

}
