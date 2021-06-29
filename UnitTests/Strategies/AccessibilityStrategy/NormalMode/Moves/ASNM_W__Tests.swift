@testable import kindaVim
import XCTest


// same as w
// we use a mock here because all the tests for this move
// are checked in the TextEngine function that this move called.
// rest is UI Tests to check that the globalColumnNumber is updated
class ASNM_W_Tests: ASNM_BaseTests {
    
    let textEngineMock = TextEngineMock()
    
    override func setUp() {
        super.setUp()
        
        asNormalMode = AccessibilityStrategyNormalMode(textEngine: textEngineMock)
    }    
    
}


// Both
extension ASNM_W_Tests {
    
    func test_that_it_calls_the_TextEngine_WORDForward_function() {
        let text = "should be calling WORDForward"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 29,
            caretLocation: 11,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 29
            )
        )
        
        _ = asNormalMode.W(on: element)
        
        XCTAssertEqual(textEngineMock.functionCalled, "beginningOfWORDForward(startingAt:in:)")        
    }
    
}

