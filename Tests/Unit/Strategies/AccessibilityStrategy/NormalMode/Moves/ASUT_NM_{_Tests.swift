@testable import kindaVim
import KeyCombination
import XCTest


// see [( for blah blah blah
class ASUT_NM_LeftBrace_Tests: ASNM_BaseTests {
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asNormalMode.leftBrace(on: element) 
    }
    
}


// emojis
extension ASUT_NM_LeftBrace_Tests {
    
    func test_that_it_returns_the_correct_caretLocation_and_selectedLength() {
        let text = """
y{ah 🤨️(🤨️ coz🤨️🤨️ the text 🤨️🤨️functions don't

care about😂️🤨️🤨️🤨️ the length but 🦋️ the move
itself d🤨️🤨️🤨️oes
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 126,
            caretLocation: 120,
            selectedLength: 3,
            selectedText: "🤨️",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 4,
                start: 106,
                end: 126
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 54)
        XCTAssertEqual(returnedElement?.selectedLength, 1)
    }
    
}

