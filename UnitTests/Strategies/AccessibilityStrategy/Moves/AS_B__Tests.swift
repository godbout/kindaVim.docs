@testable import kindaVim
import XCTest


// same as b
// using TE function here that is tested heavily
// rest of the test in UI to check for updated globalColumnNumber
class AS_B__Tests: AS_BaseTests {
    
    let textEngineMock = TextEngineMock()
    
    override func setUp() {
        super.setUp()
        
        accessibilityStrategy = AccessibilityStrategy(textEngine: textEngineMock)
    }    
    
}


// Both
extension AS_B__Tests {
    
    func test_that_it_calls_the_TextEngine_WORDBackward_function() {
        let text = """
just testing call to WORDBackward
all the cases are tested in
the TextEngineTests
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 49,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 34,
                end: 62
            )
        )
        
        _ = accessibilityStrategy.B(on: element)
        
        XCTAssertEqual(textEngineMock.functionCalled, "beginningOfWORDBackward(startingAt:in:)")        
    }
    
}
