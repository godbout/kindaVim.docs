import XCTest


class to_TV_selectedTextTests: ATEA_BaseTests {
    
    func test_that_we_can_set_the_selected_text_for_a_TextView() {
        let text = """
a full line
of banana
this time
"""
        let element = AccessibilityTextElement(
            value: text,
            length: 31,
            caretLocation: 21,
            selectedLength: 0,
            selectedText: "\nbanana banana 🍌️🍌️🍌️ banana"
        )
        
        let textInAXFocusedElement = text
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        
        let conversionSucceeded = AccessibilityTextElementAdaptor.toAXFocusedElement(from: element)
        XCTAssertTrue(conversionSucceeded)
        
        let reconvertedAccessibilityTextElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        XCTAssertEqual(reconvertedAccessibilityTextElement?.caretLocation, 52) 
        XCTAssertEqual(reconvertedAccessibilityTextElement?.value, """
a full line
of banana
banana banana 🍌️🍌️🍌️ banana
this time
"""
        )
    }
    
}
