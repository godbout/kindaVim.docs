import XCTest


class UIASVM_v_Tests: UIAS_BaseTests {}


// the 3 special cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
extension UIASVM_v_Tests {
    
    func test_that_if_the_TextElement_is_empty_it_does_not_move_the_caret_but_set_the_anchor_and_head_to_0() {
        let textInAXFocusedElement = ""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        VimEngine.shared.enterNormalMode()
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v))        
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
        XCTAssertEqual(AccessibilityStrategyVisualMode.anchor, 0)
        XCTAssertEqual(AccessibilityStrategyVisualMode.head, 0)
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_but_not_on_an_empty_line_it_goes_back_one_character_and_selects_it_and_sets_it_to_be_the_anchor_and_head() {
        let textInAXFocusedElement = """
   caret is
gonna be at the end
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)     
        VimEngine.shared.enterNormalMode()
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [])
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v))                
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.value, """
   caret is
gonna be at the end
"""
        )
        XCTAssertEqual(accessibilityElement?.caretLocation, 30)
        XCTAssertEqual(AccessibilityStrategyVisualMode.anchor, 30)
        XCTAssertEqual(AccessibilityStrategyVisualMode.head, 30)
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_and_on_an_empty_line_it_does_not_move_but_sets_the_anchor_and_head_to_caret_location() {
        let textInAXFocusedElement = """
caret is on its
own empty
    line

"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        VimEngine.shared.enterNormalMode()
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v))                        
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.value, """
caret is on its
own empty
    line

"""
        )
        XCTAssertEqual(accessibilityElement?.caretLocation, 35)
        XCTAssertEqual(AccessibilityStrategyVisualMode.anchor, 35)
        XCTAssertEqual(AccessibilityStrategyVisualMode.head, 35)
    }
    
}



extension UIASVM_v_Tests {
    
    func test_that_if_we_just_entered_VisualMode_with_v_from_NormalMode_it_sets_the_anchor_and_head_to_the_caret_location() {
        let textInAXFocusedElement = """
entering with v from
normal mode means anchor
and head are nil
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])
        VimEngine.shared.enterNormalMode()
                
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .v))        
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 32)
        XCTAssertEqual(AccessibilityStrategyVisualMode.anchor, 32)
        XCTAssertEqual(AccessibilityStrategyVisualMode.head, 32)
    }
    
    func test_that_if_we_just_entered_VisualMode_with_v_from_NormalMode_and_the_caret_location_is_over_the_line_end_limit_then_it_sets_the_caret_anchor_and_head_to_the_line_end_limit() {
        let textInAXFocusedElement = """
entering with v from
normal mode but with
caret out of boundaries
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        VimEngine.shared.enterNormalMode()        
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [])
        
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .v))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 40)
        XCTAssertEqual(AccessibilityStrategyVisualMode.anchor, 40)
        XCTAssertEqual(AccessibilityStrategyVisualMode.head, 40)
    }
    
    func test_that_if_we_were_already_in_VisualMode_Linewise_when_calling_v_it_sets_the_caret_and_anchor_to_the_end_limit_even_when_the_head_happened_to_be_after_the_end_limit() {
        let textInAXFocusedElement = """
entering with v from
VM linewise will set
the caret to the head
if the head is not after the line end limit
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        VimEngine.shared.enterNormalMode()
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))
        
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .v))    
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 62)
        XCTAssertEqual(AccessibilityStrategyVisualMode.anchor, 62)
        XCTAssertEqual(AccessibilityStrategyVisualMode.head, 62)      
    }
    
    func test_that_if_we_were_already_in_VisualMode_Characterwise_when_calling_v_it_sets_the_caret_to_the_head_location_that_will_never_be_behind_the_end_limit() {
        let textInAXFocusedElement = """
entering with v from
VM linewise will set
the caret to the head
if the head is not after the line end limit
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        VimEngine.shared.enterNormalMode()
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .k))
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .zero))
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .v))
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .e))
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .e))
        
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .v))    
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 50)
    }

    func test_that_the_caret_goes_to_the_head_location_after_having_being_switched_when_coming_from_Visual_Mode_linewise() {
        let textInAXFocusedElement = "v after a V"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        VimEngine.shared.enterNormalMode()
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .o))
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
    }
    
    func test_that_the_caret_goes_to_the_head_location_even_the_head_is_on_a_different_line_than_the_caret() {
        let textInAXFocusedElement = """
now we gonna have
the selection spread over
multiple lines
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)        
        VimEngine.shared.enterNormalMode()
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .k))
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .k))
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .v))
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .dollarSign))
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .e))
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 20)
    }
    
}
