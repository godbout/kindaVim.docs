@testable import kindaVim
import XCTest


// so this is using TE innerBrackets, which is already tested on its own.
// so as usual here we have the special cases for this move.
// also so other stuff like going back to IM or NM have to be tested through UI.
class ASUT_NM_ciInnerBrackets_Tests: ASNM_BaseTests {
    
    private func applyMove(using bracket: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asNormalMode.ciInnerBrackets(using: bracket, on: element) 
    }
    
}


// TextFields
extension ASUT_NM_ciInnerBrackets_Tests {
    
    func test_that_it_gets_the_content_between_two_brackets_on_a_same_line() {
        let text = "now that is { some stuff on the same } line"
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 43,
            caretLocation: 16,
            selectedLength: 0,
            selectedText: "",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 43
            )
        )
        
        let returnedElement = applyMove(using: "{", on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 13)
        XCTAssertEqual(returnedElement?.selectedLength, 24)
        XCTAssertEqual(returnedElement?.selectedText, "")      
    }
    
}
