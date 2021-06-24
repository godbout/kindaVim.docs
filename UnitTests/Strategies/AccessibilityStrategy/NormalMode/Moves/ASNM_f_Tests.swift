@testable import kindaVim
import XCTest


// more tests are done on the TextEngine level
// the TextEngine tests make sure it works properly if we are
// at last character, out of bound, on the character we're searching, etc...
// here the two tests relevant are:
// 1. can find the character, then getting the right location
// 2. cannot find the character, then not moving
class ASNM_f_Tests: ASNM_BaseTests {
    
    private func applyMove(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return accessibilityStrategy.f(to: character, on: element) 
    }
    
}


// Both
extension ASNM_f_Tests {
    
    func test_that_in_normal_setting_it_moves_the_caret_to_the_first_occurence_of_the_character_found_to_the_right() {
        let text = "check if f can find shit!"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 10,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 25
            )
        )
        
        
        let returnedElement = applyMove(to: "i", on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 16)
    }
    
    func test_that_if_the_character_is_not_found_then_the_caret_does_not_move() {
        let text = """
gonna look
for a character
that is not there
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 22,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 11,
                end: 27
            )
        )
        
        
        let returnedElement = applyMove(to: "z", on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 22)
    }
    
}


// TextViews
extension ASNM_f_Tests {
    
    func test_that_it_can_find_the_character_on_a_line_for_a_multiline() {
        let text = """
fFtT should
work on multilines
without crashing
yeah
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 48,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 3,
                start: 48,
                end: 52
            )
        )
        
        let returnedElement = applyMove(to: "h", on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 51)
    }
    
}
