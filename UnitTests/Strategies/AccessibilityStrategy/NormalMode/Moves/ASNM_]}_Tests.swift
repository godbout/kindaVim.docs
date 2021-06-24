@testable import kindaVim
import XCTest


class ASNM_rightBracketRightBrace_Tests: ASNM_BaseTests {
    
    let textEngineMock = TextEngineMock()
    
    override func setUp() {
        super.setUp()
        
        asNormalMode = AccessibilityStrategyNormalMode(textEngine: textEngineMock)
    }    
    
}


// Both
extension ASNM_rightBracketRightBrace_Tests {
    
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
        
        _ = asNormalMode.rightBracketRightBrace(on: element)
        
        XCTAssertEqual(textEngineMock.functionCalled, "nextUnmatched(_:after:in:)")        
    }
    
}
