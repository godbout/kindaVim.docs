import XCTest

class to_TF_selectedTextTests: ATEA_BaseTests {

    func test_that_we_can_set_the_selected_text_for_a_TextField() {
        let text = "gonna try to set the selected text"
        let accessibilityElement = AccessibilityTextElement(
            value: text,
            length: 34,
            caretLocation: 6,
            selectedLength: 0, 
            selectedText: "banana "
        )
        
        let textInAXFocusedElement = text
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        
        let conversionSucceeded = AccessibilityTextElementAdaptor.toAXFocusedElement(from: accessibilityElement)
        XCTAssertTrue(conversionSucceeded)
        
        let reconvertedAccessibilityTextElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        XCTAssertEqual(reconvertedAccessibilityTextElement?.caretLocation, 13)
        XCTAssertEqual(reconvertedAccessibilityTextElement?.value, "gonna banana try to set the selected text")
    }
}
