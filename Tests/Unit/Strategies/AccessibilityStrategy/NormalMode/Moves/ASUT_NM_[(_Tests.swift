@testable import kindaVim
import XCTest


// this move just calls a TextEngine function
// no 3 Cases because it's text based
class ASNM_leftBracketLeftParenthesis_Tests: ASNM_BaseTests {
    
    let textEngineMock = TextEngineMock()
    
    override func setUp() {
        super.setUp()
        
        asNormalMode = AccessibilityStrategyNormalMode(textEngine: textEngineMock)
    }    
    
}


// Both
extension ASNM_leftBracketLeftParenthesis_Tests {
    
    func test_that_it_calls_the_TextEngine_findPreviousUnmatched_function() {
        let text = """
just testing call to findPreviousUnmatched
all the cases are tested in
the TextEngineTests
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 90,
            caretLocation: 53,
            selectedLength: 1,
            selectedText: "s",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 43,
                end: 71
            )
        )
        
        _ = asNormalMode.leftBracketLeftParenthesis(on: element)
        
        XCTAssertEqual(textEngineMock.functionCalled, "previousUnmatched(_:before:in:)")        
    }
    
}
