@testable import kindaVim
import XCTest

class AS_w_Tests: AS_BaseTests {}

// Both
extension AS_w_Tests {

    func test_that_w_can_move_from_the_beginning_of_a_word_to_the_beginning_of_the_next_one() {
        let text = "a few words my dear"
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 6,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 19
            )
        )

        let returnedElement = accessibilityStrategy.w(on: element)

        XCTAssertEqual(returnedElement?.caretLocation, 12)
    }



}

