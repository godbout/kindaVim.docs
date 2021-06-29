@testable import kindaVim
import XCTest


// yy doesn't touch the caret position or anything else, it just copies
// the line into the NSPasteBoard, so i guess we need to check this here
class ASNM_yy_Tests: ASNM_BaseTests {
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asNormalMode.yy(on: element) 
    }
    
}


// the 3 special cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
//
// for yy, we check that in those 3 cases the Pasteboard hasn't been touched
extension ASNM_yy_Tests {
    
    func test_that_if_the_TextElement_is_empty_it_works_and_copies_the_empty_line() {
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
        NSPasteboard.general.setString("test 1 of The 3 Cases", forType: .string)
        
        _ = applyMove(on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "")
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_but_not_on_an_empty_line_it_works_and_copies_the_line() {
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
        NSPasteboard.general.setString("test 2 of The 3 Cases", forType: .string)
        
        _ = applyMove(on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "gonna be at the end")
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_and_on_an_empty_line_on_its_own_it_works_and_copies_the_line() {
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
        NSPasteboard.general.setString("test 3 of The 3 Cases", forType: .string)
        
        _ = applyMove(on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "")
    }    
    
}


// Both
extension ASNM_yy_Tests {
    
    func test_that_in_normal_setting_it_copies_the_line_into_the_buffer() {
        let text = "is that gonna be copied?"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 24,
            caretLocation: 12,
            selectedLength: 1,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 24
            )
        )
        
        _ = applyMove(on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), text)
    }
    
    func test_that_it_includes_the_end_of_the_line_linefeed() {
        let text = 
"""
multiple lines
my friend
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 24,
            caretLocation: 3,
            selectedLength: 1,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 15
            )
        )
        
        _ = applyMove(on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "multiple lines\n")
    }
    
    func test_that_it_does_not_include_the_linefeed_of_the_previous_line() {
        let text = 
            """
multiple lines
again
my friend
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 30,
            caretLocation: 17,
            selectedLength: 1,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 15,
                end: 21
            )
        )
        
        _ = applyMove(on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "again\n")
    }
    
}
