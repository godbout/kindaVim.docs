@testable import kindaVim
import XCTest


class ASNM_E__Tests: ASNM_BaseTests {
    
    let textEngineMock = TextEngineMock()
    
    override func setUp() {
        super.setUp()
        
        asNormalMode = AccessibilityStrategyNormalMode(textEngine: textEngineMock)
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
            length: 62,
            caretLocation: 55,
            selectedLength: 1,
            selectedText: "t",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 3,
                start: 43,
                end: 62
            )
        )
        
        _ = asNormalMode.E(on: element)
        
        XCTAssertEqual(textEngineMock.functionCalled, "endOfWORDForward(startingAt:in:)")        
    }
    
}
