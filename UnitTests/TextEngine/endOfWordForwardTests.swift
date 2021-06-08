@testable import kindaVim
import XCTest


class endOfWordForward: TextEngineBaseTests {}


// Both
extension endOfWordForward {

    func test_that_it_can_go_to_the_end_of_the_current_word() {
        let text = "some more words to live by..."

        let newCaretPosition = textEngine.endOfWordForward(startingAt: 11, in: text)

        XCTAssertEqual(newCaretPosition, 14)
    }

    func test_that_it_does_not_stop_at_spaces() {
        let text = "yep, it should just jump over spaces!"

        let newCaretPosition = textEngine.endOfWordForward(startingAt: 13, in: text)

        XCTAssertEqual(newCaretPosition, 18)
    }

    func test_that_it_considers_a_group_of_symbols_and_punctuations_except_underscore_as_a_word() {
        let text = "for index in text[anchorIndex..<endIndex].indices {"

        let newCaretPosition = textEngine.endOfWordForward(startingAt: 28, in: text)

        XCTAssertEqual(newCaretPosition, 31)
    }

    func test_that_it_does_not_stop_at_spaces_after_symbols() {
        let text = "func e(on element: AccessibilityTextelement?) -> AccessibilityTextElement? {"

        let newCaretPosition = textEngine.endOfWordForward(startingAt: 44, in: text)

        XCTAssertEqual(newCaretPosition, 47)
    }

    func test_that_it_should_skip_consecutive_whitespaces() {
        let text = "    continue"

        let newCaretPosition = textEngine.endOfWordForward(startingAt: 1, in: text)

        XCTAssertEqual(newCaretPosition, 11)
    }

    func test_that_it_should_skip_whitespaces_before_symbols() {
        let text = "offsetBy: location + 1,"

        let newCaretPosition = textEngine.endOfWordForward(startingAt: 17, in: text)

        XCTAssertEqual(newCaretPosition, 19)
    }

    func test_that_it_considers_consecutive_symbols_as_a_word() {
        let text = "if text[nextIndex].isWhitespace || text[nextIndex].isCharacterThatConstitutesAVimWord()"

        let newCaretPosition = textEngine.endOfWordForward(startingAt: 30, in: text)

        XCTAssertEqual(newCaretPosition, 33)
    }

}


// TextViews
extension endOfWordForward {

    func test_that_it_should_not_stop_on_linefeeds() {
        let text = """
guard index != text.index(before: endIndex) else { return text.count - 1 }
let nextIndex = text.index(after: index)
"""

        let newCaretPosition = textEngine.endOfWordForward(startingAt: 73, in: text)

        XCTAssertEqual(newCaretPosition, 77)
    }

    func test_that_it_skips_lines_that_are_just_made_of_whitespaces() {
        let text = """
let nextIndex = text.index(after: index)

if text[index].isCharacterThatConstitutesAVimWord() {
"""

        let newCaretPosition = textEngine.endOfWordForward(startingAt: 39, in: text)

        XCTAssertEqual(newCaretPosition, 58)
    }

}
