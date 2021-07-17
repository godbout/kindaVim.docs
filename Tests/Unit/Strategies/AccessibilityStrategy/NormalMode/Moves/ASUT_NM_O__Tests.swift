@testable import kindaVim
import XCTest


// O is a special move as it places the caret before the new linefeed
// it creates. i don't think it's possible with the AX API to not have to
// reposition the caret after pushing the new selectedText. therefore, unfortunately
// we have to call the ATEAdaptor from within the move. hence, tests have to be made
// in the UI Tests, as it's gonna modify the buffer. so most tests for O are there.
class ASNM_O__Tests: ASNM_BaseTests {}


// TextFields
extension ASNM_O__Tests {
    
    func test_that_for_a_TextField_it_does_nothing() {
        let text = "O shouldn't do anything in a TextField!"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 39,
            caretLocation: 23,
            selectedLength: 1,
            selectedText: " ",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 39
            )
        )
        
        let returnedElement = asNormalMode.O(on: element)
        
        XCTAssertNil(returnedElement?.selectedText)
    }
    
}
