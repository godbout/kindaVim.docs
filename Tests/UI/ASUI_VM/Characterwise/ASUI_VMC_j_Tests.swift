@testable import kindaVim
import XCTest


class ASUI_VMC_j_Tests: ASUI_VM_BaseTests {}


// TextFields
extension ASUI_VMC_j_Tests {
    
    func test_that_in_TextFields_it_does_nothing() {
        let textInAXFocusedElement = "VM jk in TextFields will do nothing"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .b))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .j))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 28)
        
    }
    
}


// TextViews
extension ASUI_VMC_j_Tests {
    
    func test_that_if_the_head_is_after_the_anchor_then_it_goes_to_the_line_below_the_head_on_the_same_column_number_and_selects_from_the_anchor_to_that_new_head_location() {
        let textInAXFocusedElement = """
wow that one is
gonna rip my
ass off lol
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .k))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .zero))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .e))
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .j))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 16)
        XCTAssertEqual(accessibilityElement?.selectedLength, 18)
    }
    
    func test_that_if_the_head_is_before_the_anchor_and_both_are_on_the_same_line_then_it_goes_to_the_line_below_the_head_on_the_same_column_number_and_selects_from_the_anchor_to_that_new_head_location() {
        let textInAXFocusedElement = """
wow that one is
gonna rip my
ass off lol
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .k))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .b))
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .j))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 26)
        XCTAssertEqual(accessibilityElement?.selectedLength, 10)
    }    
    
    func test_that_if_the_head_is_before_the_anchor_and_both_are_not_on_the_same_line_and_the_new_head_location_is_before_the_anchor_then_it_goes_to_the_line_below_the_head_on_the_same_column_number_and_selects_from_that_new_head_location_to_the_anchor() {
        let textInAXFocusedElement = """
wow that one is
gonna rip my
ass off lol
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .k))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .k))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .b))
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .j))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 25)
        XCTAssertEqual(accessibilityElement?.selectedLength, 2)        
    }
        
    func test_that_if_the_line_below_the_head_line_is_shorter_then_it_goes_to_the_end_of_that_line_and_does_not_spill_over_the_next_next_line() {
        let textInAXFocusedElement = """
wow that one is
gonna rip my
ass off lol
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .k))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .k))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .dollarSign))
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .j))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 10)
        XCTAssertEqual(accessibilityElement?.selectedLength, 19)                
    }
    
    // currently not fully compatible with Vim as moves like $ should bring all the following lines
    // to the end of line too, but currently we keep track of a precise column number rather than "the end of a line"
    func test_that_it_keeps_track_of_the_column_number() {
        let textInAXFocusedElement = """
wow that one is
gonna rip my
ass off lol
extra long one here
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [.command])
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .dollarSign))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .j))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .j))
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .j))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 14)
        XCTAssertEqual(accessibilityElement?.selectedLength, 42)           
    }
    
    func test_that_it_can_go_back_to_the_last_empty_line_if_the_Visual_Mode_started_from_there_which_means_if_the_anchor_is_there() {
        let textInAXFocusedElement = """
caret is on its
own empty
    line

"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .k))
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .j))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 35)
        XCTAssertEqual(accessibilityElement?.selectedLength, 0)        
    }
    
    func test_that_it_does_not_go_back_to_the_last_empty_line_if_the_Visual_Mode_did_not_start_from_there_and_instead_selects_till_the_end_of_the_line() {
        let textInAXFocusedElement = """
caret is on its
own empty
    line

"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .k))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .j))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertNotEqual(accessibilityElement?.caretLocation, 35)
        XCTAssertNotEqual(accessibilityElement?.selectedLength, 0)
    } 
    
}


// emojis
extension ASUI_VMC_j_Tests {
    
    func test_that_it_handles_emojis() {
        let textInAXFocusedElement = """
askdfljha😂️jsfdkhasdkfhha😂️
    asdfa😂️sdfkjhask🌲️
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .k))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .dollarSign))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .v))
        
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .j))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 26)
        XCTAssertEqual(accessibilityElement?.selectedLength, 28)
    }     
    
    func test_that_it_handles_emojis_even_with_the_weird_3rd_case() {
        let textInAXFocusedElement = """
askdfljha😂️jsfdkhasdkfhha😂️
    asdfa😂️sdfkjhask🌲️

"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .k))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .k))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .dollarSign))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .v))
        
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .j))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 26)
        XCTAssertEqual(accessibilityElement?.selectedLength, 29)
    }   
    
}
