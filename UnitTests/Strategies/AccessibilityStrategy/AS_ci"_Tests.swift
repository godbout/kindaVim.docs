@testable import kindaVim
import XCTest

class AS_ciDoubleQuote_Tests: AS_BaseTests {}

// Both
extension AS_ciDoubleQuote_Tests {
    
    func test_that_in_normal_setting_it_deletes_what_is_between_two_double_quotes() {
        let text = """
finally dealing with the "real stuff"!
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 3,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 38
            )
        )
        
        let returnedElement = accessibilityStrategy.ciDoubleQuote(on: element)
        
        XCTAssertEqual(returnedElement?.value, "finally dealing with the \"\"!")
        XCTAssertEqual(returnedElement?.caretLocation, 26)
    }
    
  
}
