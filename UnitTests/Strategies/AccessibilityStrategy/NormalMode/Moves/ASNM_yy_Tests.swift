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
        NSPasteboard.general.setString("test 1 of The 3 Cases", forType: .string)
        
        _ = applyMove(on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "test 1 of The 3 Cases")
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
        NSPasteboard.general.setString("test 2 of The 3 Cases", forType: .string)
        
        _ = applyMove(on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "test 2 of The 3 Cases")
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
        NSPasteboard.general.setString("test 3 of The 3 Cases", forType: .string)
        
        _ = applyMove(on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "test 3 of The 3 Cases")
    }    
    
}


// Both
extension ASNM_yy_Tests {
    
    func test_that_in_normal_setting_it_copies_the_line_into_the_buffer() {
        let text = "is that gonna be copied?"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 12,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
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
            caretLocation: 3,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
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
            caretLocation: 17,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 15,
                end: 21
            )
        )
        
        _ = applyMove(on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "again\n")
    }
    
}
