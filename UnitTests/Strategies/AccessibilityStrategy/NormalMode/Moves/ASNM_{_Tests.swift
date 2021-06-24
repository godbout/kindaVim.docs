@testable import kindaVim
import XCTest


class ASNM_leftBrace_Tests: ASNM_BaseTests {
    
    let textEngineMock = TextEngineMock()
    
    override func setUp() {
        super.setUp()
        
        asNormalMode = AccessibilityStrategyNormalMode(textEngine: textEngineMock)
    }    
    
}


// Both
extension ASNM_leftBrace_Tests {
    
    func test_that_it_calls_the_TextEngine_beginningOfParagraphBackward_function() {
        let text = """
just testing call to beginningOfParagraphBackward
all the cases are tested in
the TextEngineTests
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 23,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 50
            )
        )
        
        _ = asNormalMode.leftBrace(on: element)
        
        XCTAssertEqual(textEngineMock.functionCalled, "beginningOfParagraphBackward(startingAt:in:)")        
    }
    
}
