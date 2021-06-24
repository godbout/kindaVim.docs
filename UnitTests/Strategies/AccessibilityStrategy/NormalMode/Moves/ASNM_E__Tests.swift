@testable import kindaVim
import XCTest


class ASNM_E__Tests: ASNM_BaseTests {
    
    let textEngineMock = TextEngineMock()
    
    override func setUp() {
        super.setUp()
        
        accessibilityStrategy = AccessibilityStrategy(textEngine: textEngineMock)
    }    
    
}


// Both
extension ASNM_E__Tests {
    
    func test_that_it_calls_the_TextEngine_endOfWordForward_function() {
        let text = """
this should call the
endOfWordForward func
from the TextEngine
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 32,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 21,
                end: 43
            )
        )
        
        _ = accessibilityStrategy.E(on: element)
        
        XCTAssertEqual(textEngineMock.functionCalled, "endOfWORDForward(startingAt:in:)")        
    }
    
}
