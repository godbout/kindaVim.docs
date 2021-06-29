@testable import kindaVim
import XCTest


class ASNM_gE__Tests: ASNM_BaseTests {
    
    let textEngineMock = TextEngineMock()
    
    override func setUp() {
        super.setUp()
        
        asNormalMode = AccessibilityStrategyNormalMode(textEngine: textEngineMock)
    }    
    
}


// Both
extension ASNM_gE__Tests {
    
    func test_that_it_calls_the_TextEngine_endOfWORDBackward_function() {
        let text = """
this should call the
endOfWORDBackward func
from the TextEngine
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 63,
            caretLocation: 36,
            selectedLength: 1,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 21,
                end: 44
            )
        )
        
        _ = asNormalMode.gE(on: element)
        
        XCTAssertEqual(textEngineMock.functionCalled, "endOfWORDBackward(startingAt:in:)")        
    }
    
}
