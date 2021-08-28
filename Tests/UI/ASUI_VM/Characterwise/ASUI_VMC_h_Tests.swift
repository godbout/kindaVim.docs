@testable import kindaVim
import KeyCombination
import KeyCombination
import XCTest


class ASUI_VMC_h_Tests: ASUI_VM_BaseTests {}
    

// Both
extension ASUI_VMC_h_Tests {
    
    func test_that_if_the_selection_spans_over_a_single_line_and_the_head_is_after_the_anchor_then_it_goes_towards_the_beginning_of_the_line_and_reduces_the_selection_by_one() {
        let textInAXFocusedElement = "hello world"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .e))
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .h))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 5)
        XCTAssertEqual(accessibilityElement?.selectedLength, 5)
    }
    
    func test_that_if_the_selection_spans_over_a_single_line_and_the_head_is_before_the_anchor_then_it_goes_towards_the_beginning_of_the_line_and_extends_the_selection_by_one() {
        let textInAXFocusedElement = """
here is some text for VM h
with head before anchor
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .b))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .b))
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .h))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 36)
        XCTAssertEqual(accessibilityElement?.selectedLength, 9)
    }
    
}


// TextViews
extension ASUI_VMC_h_Tests {
    
    func test_that_if_the_selection_spans_over_multiple_lines_and_the_head_is_before_the_anchor_then_it_goes_towards_the_beginning_of_the_line_and_extends_the_selection() {
        let textInAXFocusedElement = """
span over multiple lines
with head before anchor
for VM h
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .zero))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .b))
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .h))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 18)
        XCTAssertEqual(accessibilityElement?.selectedLength, 15)
    }
    
    func test_that_if_the_selection_spans_over_multiple_lines_and_the_head_is_after_the_anchor_then_it_goes_towards_the_beginning_of_the_line_and_reduces_the_selection() {
        let textInAXFocusedElement = """
span over multiple lines
with head after anchor
for VM h and that should
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [.command])
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .dollarSign))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .e))
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .h))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
        XCTAssertEqual(accessibilityElement?.selectedLength, 28)
    }  
    
    func test_that_it_stops_at_the_beginning_of_lines_and_does_not_continue_moving_backward_on_the_previous_lines() {
        let textInAXFocusedElement = """
span over multiple lines
w askljaslkasdlfjak
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [.command])
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .dollarSign))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .e))
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .h))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
        XCTAssertEqual(accessibilityElement?.selectedLength, 26)        
    }
    
}


// emojis
extension ASUI_VMC_h_Tests {
    
    func test_that_it_handles_emojis_with_head_before_anchor() {
        let textInAXFocusedElement = """
wow now that 😂️😂️😂️ have to handle🙈️
    🍌️dd with the 🙈️🙈️🙈️🙈️
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .h))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .h))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .h))
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .h))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 59)
        XCTAssertEqual(accessibilityElement?.selectedLength, 13)  
    }
    
    func test_that_it_handles_emojis_with_anchor_before_head() {
        let textInAXFocusedElement = """
wow now that 😂️😂️😂️ have to handle🙈️
    🍌️dd with the 🙈️🙈️🙈️🙈️
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .underscore))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .h))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .l))
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .h))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 44)
        XCTAssertEqual(accessibilityElement?.selectedLength, 1)  
    }
    
}
