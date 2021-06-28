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
//extension ASNM_yt_Tests {
//    
//    func test_that_if_the_TextElement_is_empty_it_does_nothing_and_does_not_crash() {
//        let text = ""
//        let element = AccessibilityTextElement(
//            role: .textField,
//            value: text,
//            caretLocation: 0,
//            currentLine: AccessibilityTextElementLine(
//                fullValue: text,
//                number: nil,
//                start: nil,
//                end: nil
//            )
//        )
//        
//        NSPasteboard.general.clearContents()
//        NSPasteboard.general.setString("test 1 of The 3 Cases yt", forType: .string)
//        
//        _ = applyMove(to: "a", on: element)
//        
//        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "test 1 of The 3 Cases yt")
//    }
//    
//    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_but_not_on_an_empty_line_it_does_nothing_and_does_not_crash() {
//        let text = """
//caret is
//gonna be at the end
//"""
//        let element = AccessibilityTextElement(
//            role: .textArea,
//            value: text,
//            caretLocation: 28,
//            currentLine: AccessibilityTextElementLine(
//                fullValue: text,
//                number: nil,
//                start: nil,
//                end: nil
//            )
//        )
//        
//        NSPasteboard.general.clearContents()
//        NSPasteboard.general.setString("test 2 of The 3 Cases yt", forType: .string)
//        
//        _ = applyMove(to: "a", on: element)
//        
//        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "test 2 of The 3 Cases yt")
//    }
//    
//    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_and_on_an_empty_line_on_its_own_it_does_nothing_and_does_not_crash() {
//        let text = """
//caret is on its
//own empty
//line
//
//"""
//        let element = AccessibilityTextElement(
//            role: .textArea,
//            value: text,
//            caretLocation: 31,
//            currentLine: AccessibilityTextElementLine(
//                fullValue: text,
//                number: nil,
//                start: nil,
//                end: nil
//            )
//        )
//        
//        NSPasteboard.general.clearContents()
//        NSPasteboard.general.setString("test 3 of The 3 Cases yt", forType: .string)
//        
//        _ = applyMove(to: "a", on: element)
//        
//        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "test 3 of The 3 Cases yt")
//    }    
//    
//}


// Both
extension ASNM_yt_Tests {
    
    func test_that_in_normal_setting_it_copies_the_text_from_the_caret_to_before_the_character_found() {
        let text = "gonna use yt on this sentence"
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
            caretLocation: 4,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 18
            )
        )
        
        _ = applyMove(to: "m", on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "n a ")
    }
    
}
