@testable import kindaVim
import XCTest

class AS_l_Tests: AS_BaseTests {
    
    func test_that_l_is_moving_cursor_position_to_the_right_by_one_increment() {
        let element = AccessibilityElement(
            internalText: "hello world",
            caretLocation: 6
        )
        
        let returnedElement = accessibilityStrategy.l(on: element)
        
        XCTAssertEqual(returnedElement?.internalText, element.internalText)
        XCTAssertEqual(returnedElement?.caretLocation, 7)
    }
    
}
    
