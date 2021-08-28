@testable import kindaVim
import KeyCombination
import XCTest


class ASNM_dT__Tests: ASNM_BaseTests {
    
    private func applyMove(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asNormalMode.dT(to: character, on: element) 
    }
    
}


// Both
extension ASNM_dT__Tests {
    
    func test_that_in_normal_setting_it_selects_from_after_the_character_found_to_the_caret() {        
        let text = "gonna use dT on that sentence"
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 29,
            caretLocation: 25,
            selectedLength: 1,
            selectedText: "e",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 29
            )
        )
        
        let returnedElement = applyMove(to: "T", on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 12)
        XCTAssertEqual(returnedElement?.selectedLength, 13)
        XCTAssertEqual(returnedElement?.selectedText, "")
    }
    
    func test_that_if_the_character_is_not_found_then_it_does_nothing() {
        let text = """
gonna look
for a character
that is not there
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 44,
            caretLocation: 14,
            selectedLength: 1,
            selectedText: " ",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 11,
                end: 27
            )
        )
        
        let returnedElement = applyMove(to: "z", on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 14)
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
}


// TextViews
extension ASNM_dT__Tests {
    
    func test_that_it_can_find_the_character_on_a_line_for_a_multiline() {
        let text = """
dT on a multiline
should work 
on a line
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 40,
            caretLocation: 28,
            selectedLength: 1,
            selectedText: "k",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 18,
                end: 31
            )
        )
        
        let returnedElement = applyMove(to: "w", on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 26)
        XCTAssertEqual(returnedElement?.selectedLength, 2)
        XCTAssertEqual(returnedElement?.selectedText, "")
    }
    
}


// emojis
extension ASNM_dT__Tests {
    
    func test_that_it_handles_emojis() {
        let text = """
need to deal with
those💨️💨️💨️ faces 🥺️☹️😂️ h😀️ha
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 54,
            caretLocation: 48,
            selectedLength: 1,
            selectedText: "h",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 18,
                end: 54
            )
        )
        
        let returnedElement = applyMove(to: "h", on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 20)
        XCTAssertEqual(returnedElement?.selectedLength, 28)
        XCTAssertEqual(returnedElement?.selectedText, "")
    }
    
}
