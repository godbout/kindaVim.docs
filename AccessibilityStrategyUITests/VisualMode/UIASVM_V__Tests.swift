import XCTest


class UIASVM_V__Tests: UIAS_BaseTests {}


// the 3 cases
// but only the second one here. the other ones can be tested in the Unit VM tests
extension UIASVM_V__Tests {
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_but_not_on_an_empty_line_it_selects_the_whole_line() {
        let textInAXFocusedElement = """
this is a big pile
of words but
does it matter
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        
        let accessibilityElement = asVisualMode.V(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())
                
        XCTAssertEqual(accessibilityElement?.caretLocation, 32)        
        XCTAssertEqual(accessibilityElement?.selectedLength, 14)
    }
    
}


extension UIASVM_V__Tests {
    
    func test_that_the_caret_goes_to_the_head_location_when_coming_from_Visual_Mode_linewise() {
        let textInAXFocusedElement = """
yeah we gonna
switch the head and the
anchor
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
                        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v, shift: true))
        let accessibilityElement = asVisualMode.V(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())        
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 36)
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
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v, shift: true))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .o))
        let accessibilityElement = asVisualMode.V(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())        
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 14)
    }
     
}
