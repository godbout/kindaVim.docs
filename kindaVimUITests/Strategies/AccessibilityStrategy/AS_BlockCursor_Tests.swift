@testable import kindaVim
import XCTest

class AS_BlockCursorTests: AS_BaseTests {}

// block cursor ON
extension AS_BlockCursorTests {

    func test_that_in_normal_setting_blockcursor_ON_moves_the_caret_to_the_left_by_one_increment_and_selects_the_next_character() {
        let textInAXFocusedElement = "setting block cursor ON"
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])

        let returnedElement = accessibilityStrategy.blockCursor(.on, on: AccessibilityTextElementAdaptor.fromAXFocusedElement())

        XCTAssertEqual(returnedElement?.caretLocation, 20)
        XCTAssertEqual(returnedElement?.selectedLength, 1)
    }

    func test_that_at_the_beginning_of_a_line_blockcursor_ON_does_not_move_and_still_selects_the_next_character() {
        let textInAXFocusedElement = """
        another
        setting block cursor
        ON but that is
        multiline!
        """
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [.command])

        let returnedElement = accessibilityStrategy.blockCursor(.on, on: AccessibilityTextElementAdaptor.fromAXFocusedElement())

        XCTAssertEqual(returnedElement?.caretLocation, 29)
        XCTAssertEqual(returnedElement?.selectedLength, 1)
    }

}

// block cursor OFF
extension AS_BlockCursorTests {

    func test_that_blockcursor_OFF_removes_character_selection_and_does_not_move_the_caret() {
        let textInAXFocusedElement = "let's go block cursor OFF"
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])

        let returnedElement = accessibilityStrategy.blockCursor(.off, on: AccessibilityTextElementAdaptor.fromAXFocusedElement())

        XCTAssertEqual(returnedElement?.caretLocation, 15)
        XCTAssertEqual(returnedElement?.selectedLength, 0)
    }

}

