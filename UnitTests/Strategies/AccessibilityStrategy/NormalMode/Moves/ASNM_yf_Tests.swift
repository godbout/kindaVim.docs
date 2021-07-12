@testable import kindaVim
import XCTest


// see yt for blah blah
class ASNM_yf_Tests: ASNM_BaseTests {
    
    private func applyMove(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asNormalMode.yf(to: character, on: element) 
    }
    
}


// the 3 special cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
extension ASNM_yf_Tests {
    
    func test_that_if_the_TextElement_is_empty_it_works_and_does_nothing_lol() {
        let text = ""
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 0,
            caretLocation: 0,
            selectedLength: 0,
            selectedText: "",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 0
            )
        )
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 1 of The 3 Cases yf", forType: .string)
        
        let returnedElement = applyMove(to: "a", on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "test 1 of The 3 Cases yf")
        XCTAssertEqual(returnedElement?.selectedLength, 0)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_but_not_on_an_empty_line_it_works_and_does_nothing_lol_bis() {
        let text = """
caret is
gonna be at the end
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 28,
            caretLocation: 28,
            selectedLength: 0,
            selectedText: "",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 9,
                end: 28
            )
        )
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 2 of The 3 Cases yf", forType: .string)
        
        let returnedElement = applyMove(to: "a", on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "test 2 of The 3 Cases yf")
        XCTAssertEqual(returnedElement?.selectedLength, 0)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_and_on_an_empty_line_on_its_own_it_works_and_does_nothing_lol_thris() {
        let text = """
caret is on its
own empty
line

"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 31,
            caretLocation: 31,
            selectedLength: 0,
            selectedText: "",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 4,
                start: 31,
                end: 31
            )
        )
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 3 of The 3 Cases yf", forType: .string)
        
        let returnedElement = applyMove(to: "a", on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "test 3 of The 3 Cases yf")
        XCTAssertEqual(returnedElement?.selectedLength, 0)
        XCTAssertNil(returnedElement?.selectedText)
    }    
    
}


// Both
extension ASNM_yf_Tests {
    
    func test_that_in_normal_setting_it_copies_the_text_from_the_caret_to_the_character_found() {
        let text = "gonna use yf on this sentence"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 29,
            caretLocation: 8,
            selectedLength: 1,
            selectedText: "e",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 29
            )
        )
        
        let returnedElement = applyMove(to: "s", on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "e yf on this")
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
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
            length: 44,
            caretLocation: 14,
            selectedLength: 1,
            selectedText: " ",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 11,
                end: 27
            )
        )
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("404 character not found", forType: .string)
        
        let returnedElement = applyMove(to: "z", on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "404 character not found")
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
}


// TextViews
extension ASNM_yf_Tests {
    
    func test_that_it_can_find_the_character_on_a_line_for_a_multiline() {
        let text = """
yf on a multiline
should work 
on a line
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 40,
            caretLocation: 4,
            selectedLength: 1,
            selectedText: "n",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 18
            )
        )
        
        let returnedElement = applyMove(to: "m", on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "n a m")
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
}
