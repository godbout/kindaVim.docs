import XCTest


class UIASVM_V__Tests: UIAS_BaseTests {}


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
