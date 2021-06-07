@testable import kindaVim
import XCTest

// like the O move, this is calling the ATEAdaptor in the middle of the move
// because we need to place the caret after using the selectedText
// so there's only one basic test here, the rest is in the UI Tests
class AS_dd_Tests: AS_BaseTests {}

// TextFields
extension AS_dd_Tests {
    
    func test_that_in_normal_setting_it_deletes_the_whole_line() {
        let text = "this is a line to be deleted"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 19,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 28
            )
        )
        
        let returnedElement = accessibilityStrategy.dd(on: element)

        XCTAssertEqual(returnedElement?.caretLocation, 0)
    }
    
}

