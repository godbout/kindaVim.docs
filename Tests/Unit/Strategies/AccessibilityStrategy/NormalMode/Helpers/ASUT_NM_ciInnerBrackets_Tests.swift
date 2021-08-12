@testable import kindaVim
import XCTest


// this move uses TE innerBrackets which is already tested on its own.
// TE innerBrackets returns the range of the text found, but doesn't care if the text
// spans on a line or several. this is up to ciInnerBrackets to handle this, which is
// what we test here.
// also so other stuff like going back to IM or NM have to be tested through UI.
// also one of the test where we reposition the cursor to the first non blank need to be done through UI.
class ASUT_NM_ciInnerBrackets_Tests: ASNM_BaseTests {
    
    private func applyMove(using bracket: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asNormalMode.ciInnerBrackets(using: bracket, on: element) 
    }
    
}


// Both
extension ASUT_NM_ciInnerBrackets_Tests {
    
    func test_that_it_gets_the_content_between_two_brackets_on_a_same_line() {
        let text = "now th😄️at is ( some stuff 😄️😄️😄️on the same ) line😄️"
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 58,
            caretLocation: 18,
            selectedLength: 1,
            selectedText: "o",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 58
            )
        )
        
        let returnedElement = applyMove(using: "(", on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 16)
        XCTAssertEqual(returnedElement?.selectedLength, 33)
        XCTAssertEqual(returnedElement?.selectedText, "")      
    }
    
}


// TextViews
extension ASUT_NM_ciInnerBrackets_Tests {
  
    func test_that_it_gets_the_content_between_two_brackets_on_different_lines() {
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
        
        XCTAssertEqual(returnedElement?.caretLocation, 19)
        XCTAssertEqual(returnedElement?.selectedLength, 35)
        XCTAssertEqual(returnedElement?.selectedText, "")
    }
    
    func test_that_if_the_opening_bracket_is_immediately_followed_by_a_linefeed_the_linefeed_is_not_deleted() {
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
        
        XCTAssertEqual(returnedElement?.caretLocation, 17)
        XCTAssertEqual(returnedElement?.selectedLength, 30)
        XCTAssertEqual(returnedElement?.selectedText, "")
    }
    
    func test_that_if_the_closing_bracket_is_preceded_only_by_whitespaces_up_to_the_beginning_of_the_line_then_the_previous_line_linefeed_is_not_deleted() {
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
        
        XCTAssertEqual(returnedElement?.caretLocation, 19)
        XCTAssertEqual(returnedElement?.selectedLength, 34)
        XCTAssertEqual(returnedElement?.selectedText, "")
    }
    
    func test_that_if_the_opening_bracket_is_immediately_followed_by_a_linefeed_and_the_closing_bracket_is_immediately_preceded_by_a_linefeed_then_the_move_keeps_an_empty_line_between_the_brackets() {
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
        
        XCTAssertEqual(returnedElement?.caretLocation, 20)
        XCTAssertEqual(returnedElement?.selectedLength, 29)
        XCTAssertEqual(returnedElement?.selectedText, "")
    }

}
