@testable import kindaVim
import XCTest


class AS_A__Tests: AS_BaseTests {}


// Both
extension AS_A__Tests {
    
    func test_that_if_the_TextElement_is_empty_it_does_not_crash() {
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
        
        let returnedElement = accessibilityStrategy.A(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 0)
    }
    
}


// TextFields
extension AS_A__Tests {

    func test_that_in_normal_setting_it_goes_to_the_last_character_of_a_TextField() {
        let text = "A should go the end of this sentence"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 20,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 36
            )
        )
        
        let returnedElement = accessibilityStrategy.A(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 36)
    }
    
}


// TextViews
extension AS_A__Tests {

    func test_that_in_normal_setting_it_goes_to_the_end_of_the_line_of_a_TextView() {
        let text = """
A should go to the
end of a line
not of a whole TV
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 25,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 19,
                end: 33
            )
        )
        
        let returnedElement = accessibilityStrategy.A(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 32)
    }
    
    func test_that_if_the_caret_is_at_the_end_of_a_line_it_does_not_go_down_one_line() {
        
    }
    
    func test_that_if_the_caret_is_on_an_empty_line_it_does_not_go_down_one_line() {
        
    }
    
    func test_that_if_the_caret_is_at_the_end_of_the_TextView_it_does_not_crash() {
        
    }
     
}
