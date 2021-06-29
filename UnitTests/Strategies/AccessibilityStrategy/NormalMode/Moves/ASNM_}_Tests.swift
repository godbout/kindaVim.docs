@testable import kindaVim
import XCTest


// see [( for blah blah
class ASNM_rightBrace_Tests: ASNM_BaseTests {
    
    let textEngineMock = TextEngineMock()
    
    override func setUp() {
        super.setUp()
        
        asNormalMode = AccessibilityStrategyNormalMode(textEngine: textEngineMock)
    }    
    
}


// Both
extension ASNM_rightBrace_Tests {
    
    func test_that_it_calls_the_TextEngine_endOfParagraphForward_function() {
        let text = """
just testing call to endOfParagraphForward
all the cases are tested in
the TextEngineTests
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 90,
            caretLocation: 13,
            selectedLength: 1,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 43
            )
        )
        
        _ = asNormalMode.rightBrace(on: element)
        
        XCTAssertEqual(textEngineMock.functionCalled, "endOfParagraphForward(startingAt:in:)")        
    }
    
}
