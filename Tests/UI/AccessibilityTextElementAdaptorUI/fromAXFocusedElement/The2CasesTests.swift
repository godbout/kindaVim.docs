import XCTest


class The2CasesTests: ATEA_BaseTests {}


// TextFields
// only 1 cases for TF
extension The2CasesTests {
    
    func test_that_we_grab_a_correct_AccessibilityTextElement_when_the_TextField_is_empty() {
        let textInAXFocusedElement = ""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.role, .textField)
        XCTAssertEqual(accessibilityElement?.value, "")
        XCTAssertEqual(accessibilityElement?.length, 0)
        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
        XCTAssertEqual(accessibilityElement?.selectedLength, 0)
        XCTAssertEqual(accessibilityElement?.selectedText, "")
        XCTAssertEqual(accessibilityElement?.currentLine.value, "")
        XCTAssertEqual(accessibilityElement?.currentLine.number, 1)
        XCTAssertEqual(accessibilityElement?.currentLine.start, 0)
        XCTAssertEqual(accessibilityElement?.currentLine.end, 0)
    }
    
}


// TextViews
extension The2CasesTests {
    
    func test_that_we_grab_a_correct_AccessibilityTextElement_when_the_TextView_is_empty() {
        let textInAXFocusedElement = ""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.role, .textArea)
        XCTAssertEqual(accessibilityElement?.value, "")
        XCTAssertEqual(accessibilityElement?.length, 0)
        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
        XCTAssertEqual(accessibilityElement?.selectedLength, 0)
        XCTAssertEqual(accessibilityElement?.selectedText, "")
        XCTAssertEqual(accessibilityElement?.currentLine.value, "")
        XCTAssertEqual(accessibilityElement?.currentLine.number, 1)
        XCTAssertEqual(accessibilityElement?.currentLine.start, 0)
        XCTAssertEqual(accessibilityElement?.currentLine.end, 0)
    }
    
    func test_that_we_grab_a_correct_AccessibilityTextElement_when_the_caret_is_at_the_end_of_the_TextView_on_an_empty_line() {
        let textInAXFocusedElement = """
it's four O eight
and i'm still having fun
:D

"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.role, .textArea)
        XCTAssertEqual(accessibilityElement?.value, """
it's four O eight
and i'm still having fun
:D

"""
        )
        XCTAssertEqual(accessibilityElement?.length, 46)
        XCTAssertEqual(accessibilityElement?.caretLocation, 46)
        XCTAssertEqual(accessibilityElement?.selectedLength, 0)
        XCTAssertEqual(accessibilityElement?.selectedText, "")
        XCTAssertEqual(accessibilityElement?.currentLine.value, "")
        XCTAssertEqual(accessibilityElement?.currentLine.number, 4)
        XCTAssertEqual(accessibilityElement?.currentLine.start, 46)
        XCTAssertEqual(accessibilityElement?.currentLine.end, 46)
    }
    
}
