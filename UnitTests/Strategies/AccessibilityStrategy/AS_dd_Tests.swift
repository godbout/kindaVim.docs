@testable import kindaVim
import XCTest

// here we can only test the caret location. to test
// the content of the field we will have to use UI Tests
class AS_dd_Tests: AS_BaseTests {}

// TextField
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
