@testable import kindaVim
import XCTest


// this is using TE innerBrackets which is already heavily tested.
// so here we test only what is specific to the move, which is the NSPasteboard
// and the caret location, selectedLengh and selectedText
class ASUT_NM_yiInnerBrackets_Tests: ASNM_BaseTests {
    
    private func applyMove(using bracket: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asNormalMode.yiInnerBrackets(using: bracket, on: element) 
    }
    
}


// Both
extension ASUT_NM_yiInnerBrackets_Tests {

    func test_that_it_copies_the_inner_range_and_puts_the_caret_after_the_opening_bracket() {
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
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "😂️ has some nice ")
        XCTAssertEqual(returnedElement?.caretLocation, 16)  
        XCTAssertEqual(returnedElement?.selectedLength, 3)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
}
