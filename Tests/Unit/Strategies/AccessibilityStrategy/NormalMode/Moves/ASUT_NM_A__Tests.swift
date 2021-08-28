@testable import kindaVim
import KeyCombination
import XCTest


class ASNM_A__Tests: ASNM_BaseTests {
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asNormalMode.A(on: element) 
    }
    
}


// TextFields
extension ASNM_A__Tests {

    func test_that_in_normal_setting_it_goes_to_the_last_character_of_a_TextField() {
        let text = "A should go the end of this sentence"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 36,
            caretLocation: 20,
            selectedLength: 1,
            selectedText: "o",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 36
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 36)
        XCTAssertEqual(returnedElement?.selectedLength, 0)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
}


// TextViews
extension ASNM_A__Tests {

    func test_that_in_normal_setting_it_goes_to_the_end_of_the_line_of_a_TextView() {
        let text = """
A should go to the
end of a line
not of a whole TV
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 50,
            caretLocation: 25,
            selectedLength: 1,
            selectedText: " ",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 19,
                end: 33
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 32)
        XCTAssertEqual(returnedElement?.selectedLength, 0)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
    func test_that_if_the_caret_is_at_the_end_of_a_line_it_does_not_go_down_one_line() {
        let text = """
if the caret
is at the end of a line
it shouldn't go one line
below
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 67,
            caretLocation: 36,
            selectedLength: 1,
            selectedText: "\n",
            currentLine: AccessibilityTextElementLine(
            fullValue: text,
            number: 2,
            start: 13,
            end: 37
            )
            )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 36)
        XCTAssertEqual(returnedElement?.selectedLength, 0)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
    func test_that_if_the_caret_is_on_an_empty_line_it_does_not_go_down_one_line() {
        let text = """
if there's an empty

line the caret should
not go down
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 54,
            caretLocation: 20,
            selectedLength: 1,
            selectedText: "\n",
            currentLine: AccessibilityTextElementLine(
            fullValue: text,
            number: 2,
            start: 20,
            end: 21
            )
            )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 20)   
        XCTAssertEqual(returnedElement?.selectedLength, 0)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
}


// emojis
extension ASNM_A__Tests {
    
    func test_that_it_handles_emojis() {
        let text = """
need to deal with
those faces 🥺️☹️😂️
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 38,
            caretLocation: 25,
            selectedLength: 1,
            selectedText: "a",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 18,
                end: 38
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 38)
        XCTAssertEqual(returnedElement?.selectedLength, 0)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
}

