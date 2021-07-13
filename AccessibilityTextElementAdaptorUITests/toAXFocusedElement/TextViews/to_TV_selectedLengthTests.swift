import XCTest

class to_TV_selectedLengthTests: ATEA_BaseTests {
    
    func test_that_we_can_set_a_selection_length() {
        let text = """
that's a longer hello dear
because we're in
TextAreas
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 53,
            caretLocation: 5,
            selectedLength: 29,
            selectedText: nil,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 27
            )
        )
        
        let textInAXFocusedElement = text
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        
        let conversionSucceeded = AccessibilityTextElementAdaptor.toAXFocusedElement(from: element)
        XCTAssertTrue(conversionSucceeded)
        
        let reconvertedAccessibilityTextElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        XCTAssertEqual(reconvertedAccessibilityTextElement?.selectedLength, 29)
    }
    
    func test_that_if_the_caret_is_at_the_end_of_the_text_then_we_change_the_selection_length_to_0() {
        let text = """
that's a longer hello dear
because we're in
TextAreas
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 53,
            caretLocation: 53,
            selectedLength: 1,
            selectedText: nil,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 3,
                start: 44,
                end: 53
            )
        )
        
        let textInAXFocusedElement = text
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        
        let conversionSucceeded = AccessibilityTextElementAdaptor.toAXFocusedElement(from: element)
        XCTAssertTrue(conversionSucceeded)
        
        let reconvertedAccessibilityTextElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        XCTAssertEqual(reconvertedAccessibilityTextElement?.selectedLength, 0)
    }
    
}
