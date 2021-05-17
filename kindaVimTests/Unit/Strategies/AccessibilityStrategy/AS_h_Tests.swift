@testable import kindaVim
import XCTest

class AS_h_Tests: AS_BaseTests {
    
    func test_that_in_normal_setting_h_is_moving_the_caret_position_to_the_left_by_one_increment() {
        let element = AccessibilityElement(
            internalText: "hello world",
            caretLocation: 6
        )
    
        let returnedElement = accessibilityStrategy.h(on: element)
    
        XCTAssertEqual(returnedElement?.internalText, element.internalText)
        XCTAssertEqual(returnedElement?.caretLocation, 5)
    }
    
    func test_that_at_the_beginning_of_a_line_h_does_not_move() {
        let element = AccessibilityElement(
            internalText: """
            indeed
            that is
            multiline
            """,
            caretLocation: 7
        )
    
        let returnedElement = accessibilityStrategy.h(on: element)
    
        XCTAssertEqual(returnedElement?.internalText, element.internalText)
        XCTAssertEqual(returnedElement?.caretLocation, 7)
    }
    
}
