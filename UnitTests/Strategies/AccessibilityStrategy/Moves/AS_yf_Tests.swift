@testable import kindaVim
import XCTest


// see yt for blah blah
class AS_yf_Tests: AS_BaseTests {
    
    private func applyMove(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return accessibilityStrategy.yf(to: character, on: element) 
    }
    
}


// the 3 special cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
extension AS_yf_Tests {
    
    func test_that_if_the_TextElement_is_empty_it_does_nothing_and_does_not_crash() {
        let text = ""
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 0,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: nil,
                start: nil,
                end: nil
            )
        )
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 1 of The 3 Cases yf", forType: .string)
        
        _ = applyMove(to: "a", on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "test 1 of The 3 Cases yf")
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_but_not_on_an_empty_line_it_does_nothing_and_does_not_crash() {
        let text = """
caret is
gonna be at the end
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 28,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: nil,
                start: nil,
                end: nil
            )
        )
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 2 of The 3 Cases yf", forType: .string)
        
        _ = applyMove(to: "a", on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "test 2 of The 3 Cases yf")
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_and_on_an_empty_line_on_its_own_it_does_nothing_and_does_not_crash() {
        let text = """
caret is on its
own empty
line

"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 31,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: nil,
                start: nil,
                end: nil
            )
        )
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 3 of The 3 Cases yf", forType: .string)
        
        _ = applyMove(to: "a", on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "test 3 of The 3 Cases yf")
    }    
    
}


// Both
extension AS_yf_Tests {
    
    func test_that_in_normal_setting_it_copies_the_text_from_the_caret_to_the_character_found() {
        let text = "gonna use yf on this sentence"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 8,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 29
            )
        )
        
        _ = applyMove(to: "s", on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "e yf on this")
    }
    
    func test_that_if_the_character_is_not_found_then_it_does_nothing() {
        let text = """
gonna look
for a character
that is not there
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 14,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 11,
                end: 27
            )
        )
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("404 character not found", forType: .string)
        
        _ = applyMove(to: "z", on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "404 character not found")
    }
    
}


// TextViews
extension AS_yf_Tests {
    
    func test_that_it_can_find_the_character_on_a_line_for_a_multiline() {
        let text = """
yf on a multiline
should work 
on a line
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 4,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 18
            )
        )
        
        _ = applyMove(to: "m", on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "n a m")
    }
    
}
