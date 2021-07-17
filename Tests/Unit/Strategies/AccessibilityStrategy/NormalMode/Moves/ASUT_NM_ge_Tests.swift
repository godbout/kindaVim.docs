@testable import kindaVim
import XCTest


class ASNM_ge_Tests: ASNM_BaseTests {
    
    let textEngineMock = TextEngineMock()
    
    override func setUp() {
        super.setUp()
        
        asNormalMode = AccessibilityStrategyNormalMode(textEngine: textEngineMock)
    }    
    
}


// Both
extension ASNM_ge_Tests {
    
    func test_that_it_calls_the_TextEngine_endOfWordBackward_function() {
        let text = """
this should call the
endOfWordBackward func
from the TextEngine
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 63,
            caretLocation: 54,
            selectedLength: 1,
            selectedText: "e",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 3,
                start: 44,
                end: 63
            )
        )
        
        _ = asNormalMode.ge(on: element)
        
        XCTAssertEqual(textEngineMock.functionCalled, "endOfWordBackward(startingAt:in:)")        
    }
    
}
