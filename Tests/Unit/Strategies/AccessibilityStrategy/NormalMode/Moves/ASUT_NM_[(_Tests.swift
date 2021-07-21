@testable import kindaVim
import XCTest


// see b for blah blah
// but also here because we are looking for the specific "{" character
// we know the selectedLength is gonna 1, but we can still check the caretLocation
// and see if the emojis are fucking with the counts
class ASUT_NM_leftBracketLeftParenthesis_Tests: ASNM_BaseTests {
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asNormalMode.leftBracketLeftParenthesis(on: element) 
    }
    
}


// emojis
extension ASUT_NM_leftBracketLeftParenthesis_Tests {
    
    func test_that_it_returns_the_correct_caretLocation_and_selectedLength() {
        let text = """
yeah 🤨️(🤨️ coz🤨️🤨️ the text 🤨️🤨️functions don't
care about😂️🤨️🤨️🤨️ the length but 🦋️ the move
itself d🤨️🤨️🤨️oes
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 125,
            caretLocation: 110,
            selectedLength: 1,
            selectedText: "f",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 3,
                start: 105,
                end: 125
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 8)
        XCTAssertEqual(returnedElement?.selectedLength, 1)
    }
    
}
  
