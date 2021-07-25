import XCTest


class to_TV_selectedLengthTests: ATEA_BaseTests {
    
    func test_that_we_can_set_a_selection_length() {
        let text = """
that's a longer hello dear
because 💭️💭️ we're in
TextAreas
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 60,
            caretLocation: 5,
            selectedLength: 38,
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
        XCTAssertEqual(reconvertedAccessibilityTextElement?.selectedLength, 38)
    }
    
    func test_that_in_Visual_Mode_if_the_selection_ends_at_the_end_of_the_text_then_we_tweak_the_selection_calculation_and_remove_1_so_that_we_can_select_till_there() {
        let text = """
that's a longer hello dear
because we're in
TextAreas

"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 54,
            caretLocation: 31,
            selectedLength: 24,
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
        KindaVimEngine.shared.enterVisualMode()
        
        let conversionSucceeded = AccessibilityTextElementAdaptor.toAXFocusedElement(from: element)
        XCTAssertTrue(conversionSucceeded)
        
        let reconvertedAccessibilityTextElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        XCTAssertEqual(reconvertedAccessibilityTextElement?.selectedLength, 23)
    }
    
}
