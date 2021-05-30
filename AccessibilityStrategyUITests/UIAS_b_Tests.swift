@testable import kindaVim
import XCTest

// these tests might be removed later
// not sure it's very worthy to create
// tests to assure the globalColumnNumber
// is updated properly for each linewise
// move
class UIAS_b_Tests: UIAS_BaseTests {}

// TextViews
extension UIAS_b_Tests {
    
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
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [.command])
        
        // need to move the caretLocation to have a proper AccessibilityTextElement.globalColumnNumber
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .b))
        
        XCTAssertEqual(AccessibilityTextElement.globalColumnNumber, 5)
    }
    
}
