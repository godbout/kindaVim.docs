import KeyCombination
import XCTest


class UIASVML_h_Tests: ASUI_VM_BaseTests {}


// Both
extension UIASVML_h_Tests {
    
    func test_that_in_visual_linewise_it_does_nothing() {
        let textInAXFocusedElement = "h will only move stuff in VM characterwise"
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)     
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .h))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.value, "h will only move stuff in VM characterwise")
        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
        XCTAssertEqual(accessibilityElement?.selectedLength, 42)
    }
    
}
