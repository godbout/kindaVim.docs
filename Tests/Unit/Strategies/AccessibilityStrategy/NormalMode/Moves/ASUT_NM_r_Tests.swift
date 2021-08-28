@testable import kindaVim
import KeyCombination
import XCTest


// r has changed. when we started working with the emojis, i tried replacing
// an emoji by another character. even if an emojis may be 3 characters, it worked,
// except for numbers. for numbers, rather than the number taking 1 character, it would
// take 3 and behave strangely. so we need call the ATEAdaptor and push an update mid move
// in order to erase the emojis before replacing it by another character.
// the tests belows are the ones that don't use the push. for the other tests they
// are in the UI.

class ASUT_NM_r_Tests: ASNM_BaseTests {
    
    private func applyMove(with replacement: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asNormalMode.r(with: replacement, on: element) 
    }
    
}


// Both
extension ASUT_NM_r_Tests {
    
    func test_that_if_the_replacement_is_escape_then_it_does_nothing() {
        let text = "trying to replace by an escape does shit!"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 41,
            caretLocation: 15,
            selectedLength: 1,
            selectedText: "c",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 41
            )
        )
        
        let returnedElement = applyMove(with: "\u{1b}", on: element)
        
        XCTAssertNil(returnedElement?.selectedText)
    }
    
}


// TextViews
extension ASUT_NM_r_Tests {
    
    func test_that_if_the_caret_is_on_a_linefeed_it_does_not_replace_it() {
        let text = """
can't change a

linefeed
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 24,
            caretLocation: 15,
            selectedLength: 1,
            selectedText: "\n",
            currentLine: AccessibilityTextElementLine(
            fullValue: text,
            number: 2,
            start: 15,
            end: 16
            )
            )
        
        let returnedElement = applyMove(with: "g", on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 15)
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }
            
}
