@testable import kindaVim
import XCTest


class UIASNM_j_Tests: UIAS_BaseTests {}


// TextFields
extension UIASNM_j_Tests {

    func test_that_for_TextFields_j_returns_nil_coz_we_want_the_KS_to_take_over() {
        let textInAXFocusedElement = "j on a TextField shouldn't use the AS! think Alfred"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])
        
        let accessibilityElement = asNormalMode.j(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())

        XCTAssertNil(accessibilityElement)
    }

}

// TextViews
extension UIASNM_j_Tests {

    func test_that_in_normal_setting_j_goes_to_the_next_line_at_the_same_column() {
        let textInAXFocusedElement = """
let the fun
begin with the
crazy line and
column shit
"""

        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [.command])
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [.option])

        // need to move the caretLocation to have a proper AccessibilityTextElement.globalColumnNumber
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .l))

        let accessibilityElement = asNormalMode.j(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())

        XCTAssertEqual(accessibilityElement?.caretLocation, 16)
    }

    func test_that_if_the_next_line_is_shorter_j_goes_to_the_end_of_line_limit_of_that_next_line() {
        let textInAXFocusedElement = """
a line
but this one is much longer
and this one shorter
let's see
"""

        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [.option])

        // need to move the caretLocation to have a proper AccessibilityTextElement.globalColumnNumber
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .l))
        
        let accessibilityElement = asNormalMode.j(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())

        XCTAssertEqual(accessibilityElement?.caretLocation, 64)
    }

    func test_that_the_column_number_is_saved_and_reapplied_in_properly() {
        let textInAXFocusedElement = """
a line that is long
a shorter line
another long line longer than the first
another long line longer than all the other ones!!!
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [.command])
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [.command])

        // need to move the caretLocation to have a proper AccessibilityTextElement.globalColumnNumber
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .h))
        
        let firstJ = asNormalMode.j(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())
        XCTAssertEqual(firstJ?.caretLocation, 33)
        
        _ = AccessibilityTextElementAdaptor.toAXfocusedElement(from: firstJ!)
        let secondJ = asNormalMode.j(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())
        XCTAssertEqual(secondJ?.caretLocation, 53)
        
        _ = AccessibilityTextElementAdaptor.toAXfocusedElement(from: secondJ!)
        let thirdJ = asNormalMode.j(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())
        XCTAssertEqual(thirdJ?.caretLocation, 93)
    }
    
    func test_that_when_at_the_last_line_j_does_nothing() {
        let textInAXFocusedElement = """
at the last line
j should
shut up
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        
        // need to move the caretLocation to have a proper AccessibilityTextElement.globalColumnNumber
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .h))
        
        let accessibilityElement = asNormalMode.j(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())

        XCTAssertEqual(accessibilityElement?.caretLocation, 32)
    }
    
    func test_that_when_the_current_line_column_is_equal_to_the_next_line_length_and_that_this_line_is_not_the_last_one_the_caret_gets_at_the_correct_end_limit_of_the_next_line() {
        let textInAXFocusedElement = """
tryig somethi
some more
again
hehe
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [])
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [])
        
        // need to move the caretLocation to have a proper AccessibilityTextElement.globalColumnNumber
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .l))
        
        let accessibilityElement = asNormalMode.j(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())

        XCTAssertEqual(accessibilityElement?.caretLocation, 28)
    }

    func test_that_if_the_last_line_is_only_a_linefeed_character_j_can_still_go_there_and_the_globalColumnNumber_is_not_overriden() {
        let textInAXFocusedElement = """
another fucking
edge case

"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [])

        // need to move the caretLocation to have a proper AccessibilityTextElement.globalColumnNumber
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .l))
        let globalColumnNumber = AccessibilityTextElement.globalColumnNumber

        let accessibilityElement = asNormalMode.j(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())

        XCTAssertEqual(accessibilityElement?.caretLocation, 26)
        XCTAssertEqual(globalColumnNumber, AccessibilityTextElement.globalColumnNumber)
    }
    
}
