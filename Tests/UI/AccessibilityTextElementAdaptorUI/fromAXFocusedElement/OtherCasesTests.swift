import XCTest
import AccessibilityStrategy


class OtherCasesTests: ATEA_BaseTests {}


// TextFields
extension OtherCasesTests {
    
    func test_that_in_normal_setting_we_grab_a_correct_AccessibilityTextElement_from_a_TextField() {
        let textInAXFocusedElement = "here's some nice words for you"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.option, .shift])
        
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.role, .textField)
        XCTAssertEqual(accessibilityElement?.value, "here's some nice words for you")
        XCTAssertEqual(accessibilityElement?.length, 30)
        XCTAssertEqual(accessibilityElement?.caretLocation, 23)
        XCTAssertEqual(accessibilityElement?.selectedLength, 4)
        XCTAssertEqual(accessibilityElement?.selectedText, "for ")
        XCTAssertEqual(accessibilityElement?.currentLine.fullValue, "here's some nice words for you")
        XCTAssertEqual(accessibilityElement?.currentLine.number, 1)
        XCTAssertEqual(accessibilityElement?.currentLine.start, 0)
        XCTAssertEqual(accessibilityElement?.currentLine.end, 30)
    }
    
}


// TextViews
extension OtherCasesTests {
    
    func test_that_in_normal_setting_we_grab_a_correct_AccessibilityTextElement_from_a_TextView() {
        let textInAXFocusedElement = """
that's a TextField
with multiple lines
of course 💩️💩️💩️
because that's its
life
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.upArrow, modifierFlags: [])
        app.textFields.firstMatch.typeKey(.upArrow, modifierFlags: [.shift])
        
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.role, .textArea)
        XCTAssertEqual(accessibilityElement?.value, """
that's a TextField
with multiple lines
of course 💩️💩️💩️
because that's its
life
"""
        )
        XCTAssertEqual(accessibilityElement?.length, 82)
        XCTAssertEqual(accessibilityElement?.caretLocation, 43)
        XCTAssertEqual(accessibilityElement?.selectedLength, 20)
        XCTAssertEqual(accessibilityElement?.selectedText, "ourse 💩️💩️💩️\nbeca")
        XCTAssertEqual(accessibilityElement?.currentLine.fullValue, """
that's a TextField
with multiple lines
of course 💩️💩️💩️
because that's its
life
"""
        )
        XCTAssertEqual(accessibilityElement?.currentLine.number, 3)
        XCTAssertEqual(accessibilityElement?.currentLine.start, 39)
        XCTAssertEqual(accessibilityElement?.currentLine.end, 59)
    }
    
}
