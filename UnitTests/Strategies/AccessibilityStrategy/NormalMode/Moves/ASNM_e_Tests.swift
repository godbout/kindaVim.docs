@testable import kindaVim
import XCTest


// we use a mock here just to make sure the correct function
// is called, but all the rest of the tests are handled by:
// 1. tests of the TextEngine function this move is calling
// 2. AS UI Tests where we test that the globalColumnNumber is updated
//    correctly when the caret changes line due to this move
class ASNM_e_Tests: ASNM_BaseTests {
    
    let textEngineMock = TextEngineMock()
    
    override func setUp() {
        super.setUp()
        
        asNormalMode = AccessibilityStrategyNormalMode(textEngine: textEngineMock)
    }    
    
}


// Both
extension ASNM_e_Tests {
    
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
        
        _ = asNormalMode.e(on: element)
        
        XCTAssertEqual(textEngineMock.functionCalled, "endOfWordForward(startingAt:in:)")        
    }
    
}
