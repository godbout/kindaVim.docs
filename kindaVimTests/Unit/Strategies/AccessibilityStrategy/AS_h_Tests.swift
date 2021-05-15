@testable import kindaVim
import XCTest

class AS_h_Tests: AS_BaseTests {
    
    func test_that_h_is_moving_cursor_position_to_the_left_by_one_increment() {
        let element = AccessibilityElement(
            internalText: "hello world",
            caretLocation: 6
        )
        
        let returnedElement = accessibilityStrategy.h(on: element)
        
        XCTAssertEqual(returnedElement?.internalText, element.internalText)
        XCTAssertEqual(returnedElement?.caretLocation, 5)
    }
    
}
