@testable import kindaVim
import XCTest


// we use a mock here just to make sure the correct function
// is called, but all the rest of the tests are handled by:
// 1. tests of the TextEngine function this move is calling
// 2. AS UI Tests where we test that the globalColumnNumber is updated
//    correctly when the caret changes line due to this move
class ASNM_w_Tests: ASNM_BaseTests {
    
    let textEngineMock = TextEngineMock()
    
    override func setUp() {
        super.setUp()
        
        asNormalMode = AccessibilityStrategyNormalMode(textEngine: textEngineMock)
    }    
    
}


// Both
extension ASNM_w_Tests {

    func test_that_it_calls_the_TextEngine_wordForward_function() {
        let text = "should be calling wordForward"
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 29,
            caretLocation: 11,
            selectedLength: 1,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 29
            )
        )
        
        _ = asNormalMode.w(on: element)
        
        XCTAssertEqual(textEngineMock.functionCalled, "beginningOfWordForward(startingAt:in:)")        
    }

}

