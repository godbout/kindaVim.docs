@testable import kindaVim
import XCTest


// see [( for blah blah
class AS_rightBrace_Tests: AS_BaseTests {
    
    let textEngineMock = TextEngineMock()
    
    override func setUp() {
        super.setUp()
        
        accessibilityStrategy = AccessibilityStrategy(textEngine: textEngineMock)
    }    
    
}


// Both
extension AS_rightBrace_Tests {
    
    func test_that_it_calls_the_TextEngine_endOfParagraphForward_function() {
        let text = """
just testing call to endOfParagraphForward
all the cases are tested in
the TextEngineTests
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 13,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 43
            )
        )
        
        _ = accessibilityStrategy.rightBrace(on: element)
        
        XCTAssertEqual(textEngineMock.functionCalled, "endOfParagraphForward(startingAt:in:)")        
    }
    
}
