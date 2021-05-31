import XCTest

class to_TV_selectedTextTests: ATEA_BaseTests {
    
    func test_that_we_can_set_the_selected_text_for_a_TextView() {
        let text = """
a full line
of banana
this time
"""
        let accessibilityElement = AccessibilityTextElement(
            value: text,
            caretLocation: 21,
            selectedText: "\nbanana banana banana"
        )
        
        let textInAXFocusedElement = text
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        
        let conversionSucceeded = AccessibilityTextElementAdaptor.toAXFocusedElememt(from: accessibilityElement)
        XCTAssertTrue(conversionSucceeded)
        
        let reconvertedAccessibilityTextElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        XCTAssertEqual(reconvertedAccessibilityTextElement?.caretLocation, 42) 
        XCTAssertEqual(reconvertedAccessibilityTextElement?.value, """
a full line
of banana
banana banana banana
this time
"""
        )
    }
}
