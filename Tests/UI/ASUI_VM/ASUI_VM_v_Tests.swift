import XCTest
import KeyCombination
import AccessibilityStrategy


class ASUI_VM_v_Tests: ASUI_VM_BaseTests {}


extension ASUI_VM_v_Tests {
    
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
        KindaVimEngine.shared.enterNormalMode()
                
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .v))
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
        KindaVimEngine.shared.enterNormalMode()
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [])
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .v))
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
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .v))
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
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .k))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .zero))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .v))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .e))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .e))
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .v))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 50)
    }

    func test_that_the_caret_goes_to_the_head_location_after_having_being_switched_when_coming_from_Visual_Mode_linewise() {
        let textInAXFocusedElement = "v after a V"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .o))
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
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
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .k))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .k))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .v))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .dollarSign))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .e))
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 20)
    }
    
}


// emojis
// from what i've seen from the code, there's nothing that
// the emojis would affect
extension ASUI_VM_v_Tests {}
