@testable import kindaVim
import XCTest


class ASNM_i_Tests: ASNM_BaseTests {}


// Both
extension ASNM_i_Tests {
    
    func test_that_it_does_nothing_lol() {
        let text = "i just doesn't do shit lol. so lazy"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 35,
            caretLocation: 24,
            selectedLength: 1,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 35
            )
        )
        
        let returnedElement = asNormalMode.i(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 24)     
    }    
    
}
