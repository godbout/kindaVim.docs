@testable import kindaVim
import XCTest


class AS_rightBracketRightParenthesis_Tests: AS_BaseTests {
    
    let textEngineMock = TextEngineMock()
    
    override func setUp() {
        super.setUp()
        
        accessibilityStrategy = AccessibilityStrategy(textEngine: textEngineMock)
    }    
    
}


// Both
extension AS_rightBracketRightParenthesis_Tests {
    
    func test_that_it_calls_the_TextEngine_nextUnmatched_function() {
        let text = """
just testing call to nextUnmatched
all the cases are tested in
the TextEngineTests
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 12,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 35
            )
        )
        
        _ = accessibilityStrategy.rightBracketRightParenthesis(on: element)
        
        XCTAssertEqual(textEngineMock.functionCalled, "nextUnmatched(_:after:in:)")        
    }
    
}
