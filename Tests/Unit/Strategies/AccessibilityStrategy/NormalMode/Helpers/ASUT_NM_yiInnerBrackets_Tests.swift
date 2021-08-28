@testable import kindaVim
import KeyCombination
import XCTest


// this is using TE innerBrackets which is already heavily tested.
// so here we test only what is specific to the move, which is the NSPasteboard
// and the caret location, selectedLengh and selectedText and also whether
// the lastYankStyle goes Characterwise or Linewise (tested here because it does depend
// on the text that is being copied, so cannot test in KVE).
class ASUT_NM_yiInnerBrackets_Tests: ASNM_BaseTests {
    
    private func applyMove(using bracket: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asNormalMode.yiInnerBrackets(using: bracket, on: element) 
    }
    
}


// Both
extension ASUT_NM_yiInnerBrackets_Tests {

    func test_that_it_copies_the_inner_range_and_puts_the_caret_after_the_opening_bracket_and_that_the_LastYankStyle_is_set_to_Characterwise() {
        let text = "some text that {😂️ has some nice } braces"
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 42,
            caretLocation: 26,
            selectedLength: 1,
            selectedText: "m",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 42
            )
        )
        
        let returnedElement = applyMove(using: "{", on: element)
        
        XCTAssertEqual(KindaVimEngine.shared.lastYankStyle, .characterwise)
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "😂️ has some nice ")
        XCTAssertEqual(returnedElement?.caretLocation, 16)  
        XCTAssertEqual(returnedElement?.selectedLength, 3)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
}


// TextViews
extension ASUT_NM_yiInnerBrackets_Tests {
    
    func test_that_it_copies_the_content_between_two_brackets_on_different_lines_and_that_the_LastYankStyle_is_set_to_Characterwise() {
        let text = """
this case is when { is not followed
by a linefeed
and } is not preceded by a linefeed
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 85,
            caretLocation: 25,
            selectedLength: 0,
            selectedText: "",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 36
            )
        )
        
        let returnedElement = applyMove(using: "{", on: element)
        
        XCTAssertEqual(KindaVimEngine.shared.lastYankStyle, .characterwise)
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), """
 is not followed
by a linefeed
and 
"""
        )
        XCTAssertEqual(returnedElement?.caretLocation, 19)  
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
    func test_that_if_the_opening_bracket_is_immediately_followed_by_a_linefeed_the_linefeed_is_not_copied_and_that_the_LastYankStyle_is_set_to_Characterwise() {
        let text = """
this work when {
is followed by a linefeed
and } is not preceded by a linefeed
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 78,
            caretLocation: 29,
            selectedLength: 1,
            selectedText: "b",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 17,
                end: 43
            )
        )
        
        let returnedElement = applyMove(using: "{", on: element)
        
        XCTAssertEqual(KindaVimEngine.shared.lastYankStyle, .characterwise)
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), """
is followed by a linefeed
and 
"""
        )
        XCTAssertEqual(returnedElement?.caretLocation, 17)
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
    func test_that_if_the_closing_bracket_is_preceded_only_by_whitespaces_up_to_the_beginning_of_the_line_then_the_previous_line_linefeed_is_not_copied_and_that_the_LastYankStyle_is_set_to_Characterwise() {
        let text = """
this case is when { is not followed
by a linefeed and
     } is preceded by a linefeed
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 86,
            caretLocation: 23,
            selectedLength: 1,
            selectedText: "n",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 36
            )
        )
        
        let returnedElement = applyMove(using: "{", on: element)
        
        XCTAssertEqual(KindaVimEngine.shared.lastYankStyle, .linewise)
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), """
 is not followed
by a linefeed and
"""
        )
        XCTAssertEqual(returnedElement?.caretLocation, 19)
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
    func test_that_if_the_opening_bracket_is_immediately_followed_by_a_linefeed_and_the_closing_bracket_is_immediately_preceded_by_a_linefeed_then_the_move_keeps_an_empty_line_between_the_brackets_and_that_the_LastYankStyle_is_set_to_Linewise() {
        let text = """
this case is when {
is followed by a linefeed and
} is preceded by a linefeed
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 77,
            caretLocation: 36,
            selectedLength: 1,
            selectedText: " ",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 20,
                end: 50
            )
        )
        
        let returnedElement = applyMove(using: "{", on: element)
        
        XCTAssertEqual(KindaVimEngine.shared.lastYankStyle, .linewise)
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "is followed by a linefeed and")
        XCTAssertEqual(returnedElement?.caretLocation, 20)
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
}
