import XCTest


class The3CasesTests: ATEA_BaseTests {}


// TextFields
// only 2 cases for TF
extension The3CasesTests {
    
    func test_that_we_grab_a_correct_AccessibilityTextElement_when_the_TextField_is_empty() {
        let textInAXFocusedElement = ""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.role, .textField)
        XCTAssertEqual(accessibilityElement?.value, "")
        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
        XCTAssertEqual(accessibilityElement?.selectedLength, 0)
        XCTAssertNil(accessibilityElement?.selectedText)
        XCTAssertEqual(accessibilityElement?.currentLine.value, "")
        XCTAssertEqual(accessibilityElement?.currentLine.number, 1)
        XCTAssertEqual(accessibilityElement?.currentLine.start, 0)
        XCTAssertEqual(accessibilityElement?.currentLine.end, 0)
    }
    
    func test_that_we_grab_a_correct_AccessibilityTextElement_when_the_caret_is_at_the_end_of_the_TextField() {
        let textInAXFocusedElement = "it's four O two and i'm having so much fun :D"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.value, "it's four O two and i'm having so much fun :D")
        XCTAssertEqual(accessibilityElement?.caretLocation, 45)
        XCTAssertEqual(accessibilityElement?.selectedLength, 0)
        XCTAssertNil(accessibilityElement?.selectedText)
        XCTAssertEqual(accessibilityElement?.currentLine.value, "it's four O two and i'm having so much fun :D")
        XCTAssertEqual(accessibilityElement?.currentLine.number, 1)
        XCTAssertEqual(accessibilityElement?.currentLine.start, 0)
        XCTAssertEqual(accessibilityElement?.currentLine.end, 45)
    }
    
}


// TextViews
extension from_TF_valueTests {
    
    func test_that_we_grab_a_correct_AccessibilityTextElement_when_the_TextView_is_empty() {
        let textInAXFocusedElement = ""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.role, .textArea)
        XCTAssertEqual(accessibilityElement?.value, "")
        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
        XCTAssertEqual(accessibilityElement?.selectedLength, 0)
        XCTAssertNil(accessibilityElement?.selectedText)
        XCTAssertEqual(accessibilityElement?.currentLine.value, "")
        XCTAssertEqual(accessibilityElement?.currentLine.number, 1)
        XCTAssertEqual(accessibilityElement?.currentLine.start, 0)
        XCTAssertEqual(accessibilityElement?.currentLine.end, 0)
    }
    
    func test_that_we_grab_a_correct_AccessibilityTextElement_when_the_caret_is_at_the_end_of_the_TextView_on_a_non_empty_line() {
        let textInAXFocusedElement = """
it's four O four
and i'm having so much fun
:D
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.value, """
it's four O four
and i'm having so much fun
:D
"""
        )
        XCTAssertEqual(accessibilityElement?.caretLocation, 46)
        XCTAssertEqual(accessibilityElement?.selectedLength, 0)
        XCTAssertNil(accessibilityElement?.selectedText)
        XCTAssertEqual(accessibilityElement?.currentLine.value, ":D")
        XCTAssertEqual(accessibilityElement?.currentLine.number, 3)
        XCTAssertEqual(accessibilityElement?.currentLine.start, 44)
        XCTAssertEqual(accessibilityElement?.currentLine.end, 46)
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
        
        XCTAssertEqual(accessibilityElement?.value, """
it's four O eight
and i'm still having fun
:D

"""
        )
        XCTAssertEqual(accessibilityElement?.caretLocation, 46)
        XCTAssertEqual(accessibilityElement?.selectedLength, 0)
        XCTAssertNil(accessibilityElement?.selectedText)
        XCTAssertEqual(accessibilityElement?.currentLine.value, "")
        XCTAssertEqual(accessibilityElement?.currentLine.number, 4)
        XCTAssertEqual(accessibilityElement?.currentLine.start, 46)
        XCTAssertEqual(accessibilityElement?.currentLine.end, 46)
    }
    
}
