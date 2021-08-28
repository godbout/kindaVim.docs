import XCTest
import KeyCombination


class UIASVML_$_Tests: ASUI_VM_BaseTests {}


// Both
extension UIASVML_$_Tests {
    
    func test_that_in_visual_linewise_it_does_nothing() {
        let textInAXFocusedElement = "$ will only move stuff in VM characterwise"
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)     
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .dollarSign))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.value, "$ will only move stuff in VM characterwise")
        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
        XCTAssertEqual(accessibilityElement?.selectedLength, 42)
    }
    
}
