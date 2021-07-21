import XCTest


class to_TF_selectedLengthTests: ATEA_BaseTests {
    
    func test_that_we_can_set_a_selection_length() {
        let text = "hello you dear 🍏️"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 18,
            caretLocation: 10,
            selectedLength: 8,
            selectedText: nil,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 18
            )
        )
        
        let textInAXFocusedElement = text
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        
        let conversionSucceeded = AccessibilityTextElementAdaptor.toAXFocusedElement(from: element)
        XCTAssertTrue(conversionSucceeded)
        
        let reconvertedAccessibilityTextElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        XCTAssertEqual(reconvertedAccessibilityTextElement?.selectedLength, 8)
    }
    
    func test_that_in_Normal_Mode_if_the_caret_is_at_the_end_of_the_text_with_a_selectedLength_of_1_then_we_tweak_the_selection_length_to_0_so_that_the_caret_can_move_there() {
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
        KindaVimEngine.shared.enterNormalMode()
        
        let conversionSucceeded = AccessibilityTextElementAdaptor.toAXFocusedElement(from: element)
        XCTAssertTrue(conversionSucceeded)
        
        let reconvertedAccessibilityTextElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        XCTAssertEqual(reconvertedAccessibilityTextElement?.selectedLength, 0)
    }
    
}
