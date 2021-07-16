@testable import kindaVim
import XCTest


// there were no tests before for ATELine but 
// well now we're trying the emojis and it breaks everything so here we go.
// we gonna test with and without emojis coz i'm still not
// familiar with that utf16 shit.
class AccessibilityTextElementLineTests: XCTestCase {}


// without emojis
extension AccessibilityTextElementLineTests {
    
    func test_that_without_emojis_the_value_is_rendered_properly() {
        let text = """
here we go baby
fucking hell
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 28,
            caretLocation: 21,
            selectedLength: 3,
            selectedText: "ng ",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 16,
                end: 28
            )
        )
        
        XCTAssertEqual(element.currentLine.value, "fucking hell")
    }
    
    
    
    func test_that_without_emojis_the_end_limit_is_calculated_properly_for_a_line_without_linefeed() {
        let text = "i'm a line without linefeed"
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 27,
            caretLocation: 14,
            selectedLength: 4,
            selectedText: "hout",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 27
            )
        )
        
        XCTAssertEqual(element.currentLine.endLimit, 26)
    }
    
    func test_that_without_emojis_the_end_limit_is_calculated_properly_for_a_line_with_linefeed() {
        let text = """
now i'm a line with
a linefeed
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 30,
            caretLocation: 5,
            selectedLength: 7,
            selectedText: "'m a li",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 20
            )
        )
        
        XCTAssertEqual(element.currentLine.endLimit, 18)
    }
    
}


// with emojis
extension AccessibilityTextElementLineTests {
    
    func test_that_with_emojis_the_value_is_rendered_properly() {
        let text = """
here we go baby 😂️
💩️💩️💩️
fucking hell 🇸🇨️
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 48,
            caretLocation: 10,
            selectedLength: 2,
            selectedText: " b",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 20
            )
        )
        
        XCTAssertEqual(element.currentLine.value, "here we go baby 😂️\n")
    }
    
    
    
    func test_that_with_emojis_the_end_limit_is_calculated_properly_for_a_line_without_linefeed_when_the_emoji_is_at_the_end() {
        let text = "i'm a line without linefeed 😅️"
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 31,
            caretLocation: 19,
            selectedLength: 2,
            selectedText: "li",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 31
            )
        )
        
        XCTAssertEqual(element.currentLine.endLimit, 28)
    }
    
    func test_that_with_emojis_the_end_limit_is_calculated_properly_for_a_line_with_linefeed_when_the_emoji_is_right_before_the_linefeed() {
        let text = """
now i'm a line with 💣️
a linefeed
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 34,
            caretLocation: 12,
            selectedLength: 1,
            selectedText: "n",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 24
            )
        )
        
        XCTAssertEqual(element.currentLine.endLimit, 20)
    }
    
}
