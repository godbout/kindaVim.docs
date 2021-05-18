@testable import kindaVim
import XCTest

class AS_l_Tests: AS_BaseTests {
    
    func test_that_in_normal_setting_l_is_moving_cursor_position_to_the_right_by_one_increment() {
        let element = AccessibilityTextElement(
            internalText: "hello world",
            caretLocation: 6,
            lineEnd: 11
        )
        
        let returnedElement = accessibilityStrategy.l(on: element)
        
        XCTAssertEqual(returnedElement?.internalText, element.internalText)
        XCTAssertEqual(returnedElement?.caretLocation, 7)
    }

    func test_that_on_a_line_that_ends_with_invisible_linefeed_l_stops_two_places_before() {
        let element = AccessibilityTextElement(
            internalText: """
            indeed
            that is
            multiline
            """,
            caretLocation: 13,
            lineEnd: 15
        )

        let returnedElement = accessibilityStrategy.l(on: element)

        XCTAssertEqual(returnedElement?.internalText, element.internalText)
        XCTAssertEqual(returnedElement?.caretLocation, 13)
    }

    func test_that_on_a_line_that_ends_with_a_visible_character_l_stops_one_place_before() {
        let element = AccessibilityTextElement(
            internalText: """
            indeed
            that is
            multiline
            """,
            caretLocation: 23,
            lineEnd: 24
        )

        let returnedElement = accessibilityStrategy.l(on: element)

        XCTAssertEqual(returnedElement?.internalText, element.internalText)
        XCTAssertEqual(returnedElement?.caretLocation, 23)
    }

    func test_that_in_any_case_if_you_are_three_characters_before_the_end_you_can_still_go_right() {
        let element = AccessibilityTextElement(
            internalText: """
            indeed
            that is
            multiline
            """,
            caretLocation: 22,
            lineEnd: 24
        )

        let returnedElement = accessibilityStrategy.l(on: element)

        XCTAssertEqual(returnedElement?.internalText, element.internalText)
        XCTAssertEqual(returnedElement?.caretLocation, 23)
    }

}
