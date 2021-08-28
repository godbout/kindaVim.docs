import XCTest
import KeyCombination


class ASUI_VML_l_Tests: ASUI_VM_BaseTests {}


// Both
extension ASUI_VML_l_Tests {
    
    func test_that_in_visual_linewise_it_does_nothing() {
        let textInAXFocusedElement = "l will only move stuff in VM characterwise"
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)     
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .h))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.value, "l will only move stuff in VM characterwise")
        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
        XCTAssertEqual(accessibilityElement?.selectedLength, 42)
    }
    
}
