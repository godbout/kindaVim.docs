@testable import kindaVim
import XCTest


// r is one of those moves (like o) where we need to move the caret position
// after the move is executed (because we set the selectedText). so for those cases,
// we need to test through UI Tests. the tests below are the tests we can do
// before the caret is moved back.
class ASNM_r_Tests: ASNM_BaseTests {
    
    private func applyMove(with replacement: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asNormalMode.r(with: replacement, on: element) 
    }
    
}


// the 3 special cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
//extension ASNM_r_Tests {
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
//        let returnedElement = applyMove(with: "o", on: element)
//        
//        XCTAssertEqual(returnedElement?.caretLocation, 0)
//        XCTAssertEqual(returnedElement?.selectedLength, 0)
//        XCTAssertNil(returnedElement?.selectedText)
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
//        let returnedElement = applyMove(with: "o", on: element)
//        
//        XCTAssertEqual(returnedElement?.caretLocation, 28)
//        XCTAssertEqual(returnedElement?.selectedLength, 0)
//        XCTAssertNil(returnedElement?.selectedText)
//        
//    }
//    
//    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_and_on_an_empty_line_it_does_nothing_and_does_not_crash() {
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
//        let returnedElement = applyMove(with: "o", on: element)
//        
//        XCTAssertEqual(returnedElement?.caretLocation, 31)
//        XCTAssertEqual(returnedElement?.selectedLength, 0)
//        XCTAssertNil(returnedElement?.selectedText)
//    }
//    
//}


// Both
extension ASNM_r_Tests {
    
    func test_that_in_normal_setting_it_replaces_the_character_under_the_cursor_with_the_one_given() {
        let text = "gonna replace one of those letters..."
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 23,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 37
            )
        )
        
        let returnedElement = applyMove(with: "e", on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 23)
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertEqual(returnedElement?.selectedText, "e")        
    }
    
    func test_that_it_can_replace_a_letter_by_a_space() {
        let text = "i need more space!"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 12,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 18
            )
        )
        
        let returnedElement = applyMove(with: " ", on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 12)
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertEqual(returnedElement?.selectedText, " ")
    }
    
    func test_that_if_the_replacement_is_escape_then_it_does_nothing() {
        let text = "trying to replace by an escape does shit!"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 15,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 41
            )
        )
        
        let returnedElement = applyMove(with: "\u{1b}", on: element)
        
        XCTAssertEqual(returnedElement, element)
    }
    
}


// TextViews
extension ASNM_r_Tests {
    
    func test_that_if_the_caret_is_on_a_linefeed_it_does_not_replace_it() {
        let text = """
can't change a

linefeed
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 15,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 15,
                end: 16
            )
        )
        
        let returnedElement = applyMove(with: "g", on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 15)
        XCTAssertEqual(returnedElement?.selectedLength, 0)
        XCTAssertNil(returnedElement?.selectedText)
    }
            
}
