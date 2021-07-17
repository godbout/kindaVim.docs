import XCTest


class UIASVML_d_Tests: ASUI_VM_BaseTests {}

// currently same as Characterwise so not bothering
// the 3 special cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
extension UIASVML_d_Tests {}


// Both
extension UIASVML_d_Tests {
    
    func test_that_it_deletes_line_and_the_caret_will_go_to_the_first_non_blank_of_the_next_line_that_is_taking_over() {
        let textInAXFocusedElement = """
we gonna use VM
d here and we suppose
one extra line in between!
      to go to non blank of the line
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .j))
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .d))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
                        
        XCTAssertEqual(accessibilityElement?.value, """
we gonna use VM
      to go to non blank of the line
"""
        )
        XCTAssertEqual(accessibilityElement?.caretLocation, 22)        
    }
    
    func test_that_the_caret_will_go_the_the_end_limit_of_the_next_line_if_the_next_line_is_just_made_of_spaces() {
        let textInAXFocusedElement = """
we gonna use VM
d here and we suppose
just adding random lines
        
some more
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .j))
        
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .d))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.value, """
we gonna use VM
        
some more
"""
        )
        XCTAssertEqual(accessibilityElement?.caretLocation, 23)    
    }
    
    func test_that_if_the_next_line_is_only_blanks_the_caret_goes_to_the_limit_of_the_line_before_the_linefeed() {
        let textInAXFocusedElement = """
we gonna use VM
d here and we suppose
another line agan
      to go to non blank of the line
         
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .j))
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .d))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.value, """
we gonna use VM
d here and we suppose
         
"""
        )
        XCTAssertEqual(accessibilityElement?.caretLocation, 46)    
    }
    
    func test_that_removing_the_last_line_puts_the_caret_at_the_first_non_blank_of_the_previous_line() {
        let textInAXFocusedElement = """
   we gonna remove the last
line and caret should go up
and it would be beautiful
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])    
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .j))
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .d))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.value, """
   we gonna remove the last
"""
        )
        XCTAssertEqual(accessibilityElement?.caretLocation, 3)    
    }
    
    func test_that_if_the_head_is_before_the_anchor_it_works() {
        let textInAXFocusedElement = """
   we gonna remove the last
line and caret should go up
and it would be beautiful
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)       
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .k))
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .d))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.value, """
   we gonna remove the last
"""
        )
        XCTAssertEqual(accessibilityElement?.caretLocation, 3)    
    }
    
    func test_that_if_the_whole_text_is_to_be_deleted_well_it_gets_deleted_LOL() {
        let textInAXFocusedElement = """
blah blah blah
blah blah
blah
t
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)     
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .k))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .k))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .k))
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .d))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.value, "")
        XCTAssertEqual(accessibilityElement?.caretLocation, 0)    
    }
    
}
