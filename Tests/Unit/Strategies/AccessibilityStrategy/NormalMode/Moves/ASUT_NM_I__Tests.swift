@testable import kindaVim
import XCTest


// this move is mainly using the TextEngine.firstNonBlank function
// so most of the tests are there. we still need to test here that if the
// caret location is at the end of the line, it doesn't crash.
// and of course as usual, testing the block cursor status.
class ASNM_I__Tests: ASNM_BaseTests {
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asNormalMode.I(on: element) 
    }
    
}


// Both
extension ASNM_I__Tests {
    
    func test_that_it_calls_the_TextEngine_firstNonBlank_function() {
        let textEngineMock = TextEngineMock()
        asNormalMode = AccessibilityStrategyNormalMode(textEngine: textEngineMock)
        
        let text = """
just testing call to firstNonBlank
all the cases are tested in
the TextEngineTests
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 82,
            caretLocation: 79,
            selectedLength: 1,
            selectedText: "s",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 3,
                start: 63,
                end: 82
            )
        )
        
        _ = applyMove(on: element)
        
        XCTAssertEqual(textEngineMock.functionCalled, "firstNonBlank(in:)")        
    }
            
}
