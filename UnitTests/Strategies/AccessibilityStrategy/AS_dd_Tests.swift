@testable import kindaVim
import XCTest

// here we can only test the caret location. to test
// the content of the field we will have to use UI Tests
class AS_dd_Tests: AS_BaseTests {}

// TextFields
extension AS_dd_Tests {
    
    func test_that_in_normal_setting_it_deletes_the_whole_line() {
        let text = "this is a line to be deleted"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 19,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 28
            )
        )
        
        let returnedElement = accessibilityStrategy.dd(on: element)

        XCTAssertEqual(returnedElement?.caretLocation, 0)
    }
    
    func test_that_if_the_line_is_empty_it_does_not_crash() {
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
        
        let returnedElement = accessibilityStrategy.dd(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 0)   
    }
    
}


// TextViews
extension AS_dd_Tests {
    
    func test_that_it_normal_setting_it_deletes_the_whole_line() {
        let text = """
the caret should go down
to the next line
somehow
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 0,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 25
            )
        )
        
        let returnedElement = accessibilityStrategy.dd(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 0)  
    }
    
    func test_that_it_skips_the_spaces_on_the_next_line_and_that_it_therefore_keeps_the_indentation() {
        let text = """
if someBullshit == true {
    bs = yeah
}
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 11,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 26
            )
        )
        
        let returnedElement = accessibilityStrategy.dd(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 4) 
    }
    
    func test_that_it_skips_the_tabs_on_the_next_line_and_that_it_therefore_keeps_the_indentation() {
        let text = """
if someBullshit == true {
\tbs = yeah
}
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 11,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 26
            )
        )
        
        let returnedElement = accessibilityStrategy.dd(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 1) 
    }
    
}

