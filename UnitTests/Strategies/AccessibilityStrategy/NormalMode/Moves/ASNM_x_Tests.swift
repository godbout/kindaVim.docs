@testable import kindaVim
import XCTest


// x is one of those moves that needs to move the caret location AFTER
// it did something with the selectedText (like O). so here we can only test the cases
// where we don't call the ATEAdaptor. calling the ATEAdaptor only happens
// when the caret location is at the end of a line. that special case is tested
// in AS UI Tests
class ASNM_x_Tests: ASNM_BaseTests {
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return accessibilityStrategy.x(on: element) 
    }
    
}


// the 3 special cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
extension ASNM_x_Tests {
    
    func test_that_if_the_TextElement_is_empty_it_does_nothing_and_does_not_crash() {
        let text = ""
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 0,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: nil,
                start: nil,
                end: nil
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 0)
        XCTAssertEqual(returnedElement?.selectedLength, 0)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_but_not_on_an_empty_line_it_does_nothing_and_does_not_crash() {
        let text = """
caret is
gonna be at the end
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 28,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: nil,
                start: nil,
                end: nil
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 28)
        XCTAssertEqual(returnedElement?.selectedLength, 0)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_and_on_an_empty_line_on_its_own_it_does_nothing_and_does_not_crash() {
        let text = """
caret is on its
own empty
line

"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 31,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: nil,
                start: nil,
                end: nil
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 31)
        XCTAssertEqual(returnedElement?.selectedLength, 0)
        XCTAssertNil(returnedElement?.selectedText)
    }    
    
}


// Both
extension ASNM_x_Tests {
    
    func test_that_in_normal_setting_it_deletes_the_character_after_the_caret_location() {
        let text = "x should delete the right character"
        
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 11,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 35
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 11)
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertEqual(returnedElement?.selectedText, "")
    }
    
}
