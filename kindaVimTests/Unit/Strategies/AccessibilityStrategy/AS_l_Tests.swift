@testable import kindaVim
import XCTest

class AS_l_Tests: AS_BaseTests {
    
    func test_that_l_is_moving_cursor_position_to_the_right_by_one_increment() {
        let element = AccessibilityElement(
            text: "hello world",
            cursorLocation: 6,
            selectionLength: 0
        )
        
        let returnedElement = accessibilityStrategy.l(on: element)
        
        XCTAssertEqual(returnedElement?.text, element.text)
        XCTAssertEqual(returnedElement?.cursorLocation, 7)
        XCTAssertEqual(returnedElement?.selectionLength, element.selectionLength)
    }
    
}
    
