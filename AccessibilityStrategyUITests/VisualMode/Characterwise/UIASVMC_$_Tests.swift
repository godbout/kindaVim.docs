import XCTest


class UIASVMC_$_Tests: UIAS_BaseTests {}


/// the 3 special cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
extension UIASVMC_$_Tests {    
    
    func test_that_if_the_TextElement_is_empty_it_works_and_does_not_move() {
        let textInAXFocusedElement = ""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        VimEngine.shared.enterNormalMode()
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v))        
        
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .dollarSign))
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
        
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .dollarSign))        
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.value, """
   caret is
gonna be at the end
"""
        )
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
        
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .dollarSign))                
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.value, """
caret is on its
own empty
    line

"""
        )
        XCTAssertEqual(accessibilityElement?.caretLocation, 35)
    }
    
}


// Both
extension UIASVMC_$_Tests {
            
    func test_that_if_the_line_ends_with_a_visible_character_the_selection_goes_to_that_last_character() {
        let textInAXFocusedElement = "hello world"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])
        VimEngine.shared.enterNormalMode()
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v))        
        
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .dollarSign))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 5)
        XCTAssertEqual(accessibilityElement?.selectedLength, 6)
    }
    
    func test_that_it_starts_the_selection_at_the_anchor_and_not_at_the_current_caret_location() {
        let textInAXFocusedElement = """
$ for visual mode starts
at the anchor, not at the caret location
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        VimEngine.shared.enterNormalMode()
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .b))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .b))
        
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .dollarSign))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 57)
        XCTAssertEqual(accessibilityElement?.selectedLength, 8)
    }
    
}


// TextViews
extension UIASVMC_$_Tests {
    
    func test_that_if_line_ends_with_linefeed_it_goes_to_the_end_of_the_line_still() {
        let textInAXFocusedElement = """
indeed
that is
multiline
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        VimEngine.shared.enterNormalMode()
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .b))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .dollarSign))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 12)
        XCTAssertEqual(accessibilityElement?.selectedLength, 3)
    }
    
    func test_that_if_the_selection_spans_over_multiple_lines_it_goes_to_the_end_of_the_line_where_the_head_is_located() {
        let textInAXFocusedElement = """
we gonna select
over multiple lines coz
$ doesn't work LOOOLL
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        VimEngine.shared.enterNormalMode()
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .e))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .e))
        
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .dollarSign))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 36)
        XCTAssertEqual(accessibilityElement?.selectedLength, 25)
    }
    
}



