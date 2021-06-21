@testable import kindaVim
import XCTest


class AS_leftBrace_Tests: AS_BaseTests {
    
    let textEngineMock = TextEngineMock()
    
    override func setUp() {
        super.setUp()
        
        accessibilityStrategy = AccessibilityStrategy(textEngine: textEngineMock)
    }    
    
}


// Both
extension AS_leftBrace_Tests {
    
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
        
        _ = accessibilityStrategy.leftBrace(on: element)
        
        XCTAssertEqual(textEngineMock.functionCalled, "beginningOfParagraphBackward(startingAt:in:)")        
    }
    
}
