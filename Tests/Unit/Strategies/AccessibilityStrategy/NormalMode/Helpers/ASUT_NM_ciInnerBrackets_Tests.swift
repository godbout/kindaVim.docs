@testable import kindaVim
import KeyCombination
import XCTest


// this move uses TE innerBrackets which is already tested on its own.
// TE innerBrackets returns the range of the text found, but doesn't care if the text
// spans on a line or several. this is up to ciInnerBrackets to handle this, which is
// what we test here.
// also so other stuff like going back to IM or NM have to be tested through UI.
// also some tests need to be moved to UI, i.e. when the { is followed by a linefeed, because
// we need to query the AX to get info about the next line.
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

}
