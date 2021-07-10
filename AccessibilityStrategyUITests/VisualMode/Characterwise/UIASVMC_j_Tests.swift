@testable import kindaVim
import XCTest


class UIASSVMC_j_Tests: UIAS_BaseTests {}


// the 3 special cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
extension UIASSVMC_j_Tests {
    
    func test_that_if_the_TextElement_is_empty_it_works_and_does_not_move() {
        let textInAXFocusedElement = ""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        VimEngine.shared.enterNormalMode()
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v))        
        
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .j))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_but_not_on_an_empty_line_it_goes_back_one_character() {
        let textInAXFocusedElement = """
   caret is
gonna be at the end
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)     
        VimEngine.shared.enterNormalMode()
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [])
        
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .j))        
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 30)
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_and_on_an_empty_line_it_works_and_does_nothing() {
        let textInAXFocusedElement = """
caret is on its
own empty
    line

"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        VimEngine.shared.enterNormalMode()
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [])
        
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .j))                
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 35)
    } 
    
}


// TextFields
extension UIASSVMC_j_Tests {
    
    func test_that_in_TextFields_it_does_nothing() {
        let textInAXFocusedElement = "VM jk in TextFields will do nothing"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        VimEngine.shared.enterNormalMode()
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .b))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .j))                
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 28)
        
    }
    
}


// TextViews
extension UIASSVMC_j_Tests {
    
    func test_that_if_the_head_is_after_the_anchor_then_it_goes_to_the_line_below_the_head_on_the_same_column_number_and_selects_from_the_anchor_to_that_new_head_location() {
        let textInAXFocusedElement = """
wow that one is
gonna rip my
ass off lol
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        VimEngine.shared.enterNormalMode()
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .k))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .zero))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .e))
        
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .j))                
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
        VimEngine.shared.enterNormalMode()
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .k))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .b))
        
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .j))                
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
        VimEngine.shared.enterNormalMode()
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .k))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .k))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .b))
        
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .j))                
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
        VimEngine.shared.enterNormalMode()
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .k))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .k))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .dollarSign))
        
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .j))                
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
        VimEngine.shared.enterNormalMode()
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .dollarSign))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .j))
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .j))
        
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .j))                
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
        VimEngine.shared.enterNormalMode()
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .k))
        
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .j))                
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
        VimEngine.shared.enterNormalMode()
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .k))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .j))                
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 26)
        XCTAssertEqual(accessibilityElement?.selectedLength, 9)        
    } 
    
}
