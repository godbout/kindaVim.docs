import XCTest

class to_TF_selectedLengthTests: ATEA_BaseTests {
    
    func test_that_we_can_set_a_selection_length() {
        let text = "hello you dear"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 14,
            caretLocation: 5,
            selectedLength: 5,
            selectedText: nil,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 14
            )
        )
        
        let textInAXFocusedElement = text
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        
        let conversionSucceeded = AccessibilityTextElementAdaptor.toAXFocusedElement(from: element)
        XCTAssertTrue(conversionSucceeded)
        
        let reconvertedAccessibilityTextElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        XCTAssertEqual(reconvertedAccessibilityTextElement?.selectedLength, 5)
    }
    
    func test_that_if_the_caret_is_at_the_end_of_the_text_then_we_change_the_selection_length_to_0() {
        let text = "hello you dear"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 14,
            caretLocation: 14,
            selectedLength: 1,
            selectedText: nil,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 14
            )
        )
        
        let textInAXFocusedElement = text
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        
        let conversionSucceeded = AccessibilityTextElementAdaptor.toAXFocusedElement(from: element)
        XCTAssertTrue(conversionSucceeded)
        
        let reconvertedAccessibilityTextElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        XCTAssertEqual(reconvertedAccessibilityTextElement?.selectedLength, 0)
    }
    
}
