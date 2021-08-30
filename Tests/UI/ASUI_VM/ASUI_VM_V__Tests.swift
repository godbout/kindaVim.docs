import XCTest
import KeyCombination
import AccessibilityStrategy


class ASUI_VM_V__Tests: ASUI_VM_BaseTests {}


// Both
extension ASUI_VM_V__Tests {
    
    func test_that_it_selects_the_whole_line_even_if_it_does_not_end_with_a_linefeed() {
        let textInAXFocusedElement = "a sentence without a linefeed"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
        XCTAssertEqual(AccessibilityStrategyVisualMode.anchor, 0)
        XCTAssertEqual(AccessibilityStrategyVisualMode.head, 28)
    }
    
}


// TextAreas
extension ASUI_VM_V__Tests {
       
    func test_that_if_we_just_entered_VisualMode_with_V_from_NormalMode_it_sets_the_anchor_and_caret_to_start_of_the_line_and_head_and_selection_to_end_of_line() {
        let textInAXFocusedElement = """
now that's one with
a linefeed at the end
!
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        KindaVimEngine.shared.enterNormalMode()
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()                
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 20)
        XCTAssertEqual(AccessibilityStrategyVisualMode.anchor, 20)
        XCTAssertEqual(AccessibilityStrategyVisualMode.head, 41)
    }
    
    func test_that_if_we_were_in_VisualMode_Characterwise_when_calling_V_it_sets_the_anchor_and_caret_to_start_of_the_line_and_head_and_selection_to_end_of_line() {
        let textInAXFocusedElement = """
entering with V from
normal mode means anchor
and head are nil
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .v))
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()     
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 46)
        XCTAssertEqual(AccessibilityStrategyVisualMode.anchor, 46)
        XCTAssertEqual(AccessibilityStrategyVisualMode.head, 61)
    }
        
    func test_that_if_we_were_already_in_VisualMode_Linewise_when_calling_V_it_sets_the_caret_to_the_end_limit_even_when_the_head_happened_to_be_after_the_end_limit() {
        let textInAXFocusedElement = """
yeah we gonna
switch the head and the
anchor
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))
        KindaVimEngine.shared.enterNormalMode()
                        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()             
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 14)
    }
    
    func test_that_the_caret_goes_to_the_head_location_after_having_being_switched_when_coming_from_Visual_Mode_linewise() {
        let textInAXFocusedElement = """
yeah we gonna
switch the head and the
anchor
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        KindaVimEngine.shared.enterNormalMode()
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .o))
        let accessibilityElement = asVisualMode.VForVisualStyleLinewise(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())        
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 14)
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
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .j))
        
        let accessibilityElement = asVisualMode.VForVisualStyleLinewise(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 42)
    }
     
}


// emojis
// same as VM v. from what i saw from the code, nothing the emojis would affect
extension ASUI_VM_V__Tests {}
