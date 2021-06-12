@testable import kindaVim
import XCTest


class AS_yiDoubleQuote_Tests: AS_BaseTests {

    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return accessibilityStrategy.yiDoubleQuote(on: element)
    }

}


// the 3 special cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
//
// for this move we check that in The 3 Cases the Pasteboard hasn't been touched
extension AS_yiDoubleQuote_Tests {

    func test_that_if_the_TextElement_is_empty_it_does_nothing_and_does_not_crash() {
        let text = ""
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 0,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: nil,
                start: nil,
                end: nil
            )
        )

        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 1 of The 3 Cases", forType: .string)

        _ = applyMove(on: element)

        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "test 1 of The 3 Cases")
    }

    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_but_not_on_an_empty_line_it_does_nothing_and_does_not_crash() {
        let text = """
caret is
gonna be at the end
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 28,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: nil,
                start: nil,
                end: nil
            )
        )

        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 2 of The 3 Cases", forType: .string)

        _ = applyMove(on: element)

        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "test 2 of The 3 Cases")
    }

    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_and_on_an_empty_line_on_its_own_it_does_nothing_and_does_not_crash() {
        let text = """
caret is on its
own empty
line

"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 31,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: nil,
                start: nil,
                end: nil
            )
        )

        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 3 of The 3 Cases", forType: .string)

        _ = applyMove(on: element)

        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "test 3 of The 3 Cases")
    }

}



// Both
extension AS_yiDoubleQuote_Tests {

    func test_that_in_normal_setting_it_copies_the_content_within_the_quotes_and_move_the_caret_correctly_inside() {
        let text = """
just some "text" you see
"""
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 7,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 24
            )
        )

        let returnedElement = applyMove(on: element)

        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "text")
        XCTAssertEqual(returnedElement?.caretLocation, 11)
    }

}
