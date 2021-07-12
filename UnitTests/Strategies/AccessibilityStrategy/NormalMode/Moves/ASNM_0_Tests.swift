@testable import kindaVim
import XCTest


class ASNM_0_Tests: ASNM_BaseTests {
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asNormalMode.zero(on: element) 
    }
    
}


// The 3 Cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
extension ASNM_0_Tests {
    
    func test_that_if_the_TextElement_is_empty_it_does_not_move() {
        let text = ""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 0,
            caretLocation: 0,
            selectedLength: 0,
            selectedText: "",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 0
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 0)
        XCTAssertEqual(returnedElement?.selectedLength, 0)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_but_not_on_an_empty_line_it_works_and_goes_to_the_first_character_of_the_line() {
        let text = """
caret is
gonna be at the end
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 28,
            caretLocation: 27,
            selectedLength: 1,
            selectedText: "d",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 9,
                end: 28
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 9)
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_and_on_an_empty_line_on_its_own_it_does_not_move() {
        let text = """
caret is on its
own empty
line

"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 31,
            caretLocation: 31,
            selectedLength: 0,
            selectedText: "",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 4,
                start: 31,
                end: 31
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 31)
        XCTAssertEqual(returnedElement?.selectedLength, 0)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
}


// Both
extension ASNM_0_Tests {

    func test_that_in_normal_setting_0_is_moving_the_caret_position_to_the_first_character_of_the_line() {
        let text = "0 should send us to the beginning of the line"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 45,
            caretLocation: 15,
            selectedLength: 1,
            selectedText: "s",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 45
            )
        )

        let returnedElement = applyMove(on: element)

        XCTAssertEqual(returnedElement?.caretLocation, 0)
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }    

}

// TextViews
extension ASNM_0_Tests {

    func test_that_at_the_beginning_of_a_line_zero_does_not_move() {
        let text = """
multiline
where we gonna test 0
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 31,
            caretLocation: 10,
            selectedLength: 1,
            selectedText: "w",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 10,
                end: 31
            )
        )
        let returnedElement = applyMove(on: element)

        XCTAssertEqual(returnedElement?.caretLocation, 10)
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }

}
