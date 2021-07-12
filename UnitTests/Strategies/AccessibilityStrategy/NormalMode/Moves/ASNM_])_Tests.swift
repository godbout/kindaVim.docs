@testable import kindaVim
import XCTest


class ASNM_rightBracketRightParenthesis_Tests: ASNM_BaseTests {
    
    let textEngineMock = TextEngineMock()
    
    override func setUp() {
        super.setUp()
        
        asNormalMode = AccessibilityStrategyNormalMode(textEngine: textEngineMock)
    }    
    
}


// Both
extension ASNM_rightBracketRightParenthesis_Tests {
    
    func test_that_it_calls_the_TextEngine_nextUnmatched_function() {
        let text = """
just testing call to nextUnmatched
all the cases are tested in
the TextEngineTests
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 82,
            caretLocation: 60,
            selectedLength: 1,
            selectedText: "i",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 35,
                end: 63
            )
        )
        
        _ = asNormalMode.rightBracketRightParenthesis(on: element)
        
        XCTAssertEqual(textEngineMock.functionCalled, "nextUnmatched(_:after:in:)")        
    }
    
}
