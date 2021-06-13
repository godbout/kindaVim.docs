@testable import kindaVim
import XCTest


// we use a mock here just to make sure the correct function
// is called, but all the rest of the tests are handled by:
// 1. tests of the TextEngine function this move is calling
// 2. AS UI Tests where we test that the globalColumnNumber is updated
//    correctly when the caret changes line due to this move
class AS_w_Tests: AS_BaseTests {
    
    let textEngineMock = TextEngineMock()
    
    override func setUp() {
        super.setUp()
        
        accessibilityStrategy = AccessibilityStrategy(textEngine: textEngineMock)
    }    
    
}


// Both
extension AS_w_Tests {

    func test_that_it_calls_the_TextEngine_wordForward_function() {
        let text = "should be calling wordForward"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 11,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 29
            )
        )
        
        _ = accessibilityStrategy.w(on: element)
        
        XCTAssertEqual(textEngineMock.functionCalled, "beginningOfWordForward(startingAt:in:)")        
    }

}

