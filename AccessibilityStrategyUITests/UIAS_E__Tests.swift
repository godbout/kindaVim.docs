@testable import kindaVim
import XCTest



class UIAS_E__Tests: UIAS_BaseTests {}


// TextViews
extension UIAS_E__Tests {
    
    func test_that_it_does_update_the_globalColumnNumber_correctly() {
        let textInAXFocusedElement = """
this is to make
sure that when the move
changes line then
the globalColumnNumber
gets-updat.ed properly
"""
        
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [.command])
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [])
        
        // need to move the caretLocation to have a proper AccessibilityTextElement.globalColumnNumber
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .e, shift: true))
        
        XCTAssertEqual(AccessibilityTextElement.globalColumnNumber, 13)
    }
    
}
