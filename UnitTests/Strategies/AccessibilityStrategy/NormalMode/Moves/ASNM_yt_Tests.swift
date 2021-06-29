@testable import kindaVim
import XCTest


// yt uses t internally, which is already tested.
// just some tests here to confirm the NSPasteboard got filled
// we don't bother with caretLocation and stuff coz they're completely untouched
class ASNM_yt_Tests: ASNM_BaseTests {
    
    private func applyMove(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asNormalMode.yt(to: character, on: element) 
    }
    
}


// the 3 special cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
//
// for this move we check that in The 3 Cases the Pasteboard hasn't been touched
extension ASNM_yt_Tests {
    
    func test_that_if_the_TextElement_is_empty_it_works_and_does_nothing_lol() {
        let text = ""
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 0,
            caretLocation: 0,
            selectedLength: 0,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 0
            )
        )
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 1 of The 3 Cases yt", forType: .string)
        
        _ = applyMove(to: "a", on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "test 1 of The 3 Cases yt")
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
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 9,
                end: 28
            )
        )
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 2 of The 3 Cases yt", forType: .string)
        
        _ = applyMove(to: "a", on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "test 2 of The 3 Cases yt")
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
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 4,
                start: 31,
                end: 31
            )
        )
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 3 of The 3 Cases yt", forType: .string)
        
        _ = applyMove(to: "a", on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "test 3 of The 3 Cases yt")
    }    
    
}


// Both
extension ASNM_yt_Tests {
    
    func test_that_in_normal_setting_it_copies_the_text_from_the_caret_to_before_the_character_found() {
        let text = "gonna use yt on this sentence"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 29,
            caretLocation: 8,
            selectedLength: 1,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 29
            )
        )
        
        _ = applyMove(to: "s", on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "e yt on thi")
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
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
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
extension ASNM_yt_Tests {
    
    func test_that_it_can_find_the_character_on_a_line_for_a_multiline() {
        let text = """
yt on a multiline
should work 
on a line
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 40,
            caretLocation: 4,
            selectedLength: 1,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 18
            )
        )
        
        _ = applyMove(to: "m", on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "n a ")
    }
    
}
