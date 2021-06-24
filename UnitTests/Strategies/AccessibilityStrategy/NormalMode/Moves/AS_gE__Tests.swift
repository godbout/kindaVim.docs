@testable import kindaVim
import XCTest


class AS_gE__Tests: AS_BaseTests {
    
    let textEngineMock = TextEngineMock()
    
    override func setUp() {
        super.setUp()
        
        accessibilityStrategy = AccessibilityStrategy(textEngine: textEngineMock)
    }    
    
}


// Both
extension AS_gE__Tests {
    
    func test_that_it_calls_the_TextEngine_endOfWORDBackward_function() {
        let text = """
this should call the
endOfWORDBackward func
from the TextEngine
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 36,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 21,
                end: 44
            )
        )
        
        _ = accessibilityStrategy.gE(on: element)
        
        XCTAssertEqual(textEngineMock.functionCalled, "endOfWORDBackward(startingAt:in:)")        
    }
    
}
