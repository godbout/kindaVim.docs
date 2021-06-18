@testable import kindaVim
import XCTest


// this move just calls a TextEngine function
// no 3 Cases because it's text based
class AS_leftBracketLeftParenthesis_Tests: AS_BaseTests {
    
    let textEngineMock = TextEngineMock()
    
    override func setUp() {
        super.setUp()
        
        accessibilityStrategy = AccessibilityStrategy(textEngine: textEngineMock)
    }    
    
}


// Both
extension AS_leftBracketLeftParenthesis_Tests {
    
    func test_that_it_calls_the_TextEngine_findPreviousUnmatched_function() {
        let text = """
just testing call to findPreviousUnmatched
all the cases are tested in
the TextEngineTests
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 88,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 71,
                end: 90
            )
        )
        
        _ = accessibilityStrategy.leftBracketLeftParenthesis(on: element)
        
        XCTAssertEqual(textEngineMock.functionCalled, "previousUnmatched(_:before:in:)")        
    }
    
}
