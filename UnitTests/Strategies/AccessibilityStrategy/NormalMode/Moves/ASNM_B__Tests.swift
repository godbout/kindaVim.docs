@testable import kindaVim
import XCTest


// same as b
// using TE function here that is tested heavily
// rest of the test in UI to check for updated globalColumnNumber
class ASNM_B__Tests: ASNM_BaseTests {
    
    let textEngineMock = TextEngineMock()
    
    override func setUp() {
        super.setUp()
        
        asNormalMode = AccessibilityStrategyNormalMode(textEngine: textEngineMock)
    }    
    
}


// Both
extension ASNM_B__Tests {
    
    func test_that_it_calls_the_TextEngine_WORDBackward_function() {
        let text = """
just testing call to WORDBackward
all the cases are tested in
the TextEngineTests
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 81,
            caretLocation: 49,
            selectedLength: 1,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 34,
                end: 62
            )
        )
        
        _ = asNormalMode.B(on: element)
        
        XCTAssertEqual(textEngineMock.functionCalled, "beginningOfWORDBackward(startingAt:in:)")        
    }
    
}

