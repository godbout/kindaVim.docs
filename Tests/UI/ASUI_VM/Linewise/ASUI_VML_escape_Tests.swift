import KeyCombination
import XCTest


// see the other VM escape for explanation
class UIASVML_escape_Tests: ASUI_VM_BaseTests {}


// TextFields
extension UIASVML_escape_Tests {
    
    func test_that_the_caret_location_goes_to_the_head() {
        let textInAXFocusedElement = "some plain simple text for once"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .escape))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
    }
    
}


// TextViews
extension UIASVML_escape_Tests {
    
    func test_that_the_caret_location_goes_to_the_head_even_when_the_selection_spans_over_multiple_lines() {
        let textInAXFocusedElement = """
let's try with selecting
over multiple lines
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .k))
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .escape))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
    }
    
    func test_that_if_the_head_is_above_line_end_limit_then_the_caret_goes_to_the_end_limit() {
        let textInAXFocusedElement = """
so this is definitely
gonna go after
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .k))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .j))
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .escape))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
    }    
    
}
