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
            length: 62,
            caretLocation: 32,
            selectedLength: 1,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 21,
                end: 43
            )
        )
        
        _ = asNormalMode.ge(on: element)
        
        XCTAssertEqual(textEngineMock.functionCalled, "endOfWordBackward(startingAt:in:)")        
    }
    
}
