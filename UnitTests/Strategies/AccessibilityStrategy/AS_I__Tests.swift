@testable import kindaVim
import XCTest


// this move is mainly using the TextEngine.firstNonBlank function
// so most of the tests are there. we still need to test here that if the
// caret location is at the end of the line, it doesn't crash.
// and of course as usual, testing the block cursor status.
class AS_I__Tests: AS_BaseTests {
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return accessibilityStrategy.I(on: element) 
    }
    
}



// Both
extension AS_I__Tests {
    
    func test_that_it_calls_the_TextEngine_firstNonBlank_function() {
        let textEngineMock = TextEngineMock()
        accessibilityStrategy = AccessibilityStrategy(textEngine: textEngineMock)
        
        let text = """
just testing call to firstNonBlank
all the cases are tested in
the TextEngineTests
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 79,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 63,
                end: 82
            )
        )
        
        _ = applyMove(on: element)
        
        XCTAssertEqual(textEngineMock.functionCalled, "firstNonBlank(in:)")        
    }
    
    func test_that_if_the_caret_is_at_the_end_of_the_TextField_it_does_not_crash() {
        let text = "    if caret is at the end it should not crash!"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 47,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: nil,
                start: nil,
                end: nil
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 47)
    }
        
    func test_that_it_drops_the_block_cursor() {
        let text = "checking the block cursor status when calling that shit move!"
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 0,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 12
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.selectedLength, 0)
    }
    
}
