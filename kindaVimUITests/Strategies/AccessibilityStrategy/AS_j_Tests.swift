@testable import kindaVim
import XCTest

class AS_j_Tests: AS_BaseTests {}

// TextFields
extension AS_j_Tests {

    func test_that_for_TextFields_j_returns_nil_coz_we_want_the_KS_to_take_over() {
        let textInAXFocusedElement = "j on a TextField shouldn't use the AS! think Alfred"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])
        
        let accessibilityElement = accessibilityStrategy.j(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())

        XCTAssertNil(accessibilityElement)
    }

}

// TextViews
extension AS_j_Tests {

    func test_that_in_normal_setting_j_goes_to_the_next_line_at_the_same_column() {
//        VimEngine.shared.enterNormalMode()
        
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

        let accessibilityElement = accessibilityStrategy.j(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())

        XCTAssertEqual(accessibilityElement?.axCaretLocation, 16)
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
        
        let accessibilityElement = accessibilityStrategy.j(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())

        XCTAssertEqual(accessibilityElement?.axCaretLocation, 64)
    }

    func test_that_the_column_number_is_saved_and_reapplied_when_we_go_from_one_line_to_a_shorter_one_to_a_longer_than_the_first_one() {
        let textInAXFocusedElement = """
a line that is long
a shorter line
another long line longer than the first
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [.command])
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [.command])

        // need to move the caretLocation to have a proper AccessibilityTextElement.globalColumnNumber
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .h))
        
        let firstJ = accessibilityStrategy.j(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())
        _ = AccessibilityTextElementAdaptor.toAXFocusedElememt(from: firstJ!)
        let secondJ = accessibilityStrategy.j(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())
        _ = AccessibilityTextElementAdaptor.toAXFocusedElememt(from: secondJ!)

        let accessibilityElement = accessibilityStrategy.j(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())

        XCTAssertEqual(accessibilityElement?.axCaretLocation, 53)
    }
    
}
