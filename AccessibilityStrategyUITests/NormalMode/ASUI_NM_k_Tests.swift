@testable import kindaVim
import XCTest


// check j for why no TextFields tests here
class UIASNM_k_Tests: UIAS_BaseTests {
    
    private func applyMoveAndGetBackAccessibilityElement() -> AccessibilityTextElement? {
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .k))
        
        return AccessibilityTextElementAdaptor.fromAXFocusedElement()
    }
    
}


// the 3 special cases, same as j, no TF tests here
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
extension UIASNM_k_Tests {    
    
    func test_that_if_the_TextElement_is_empty_it_works_and_does_not_move() {
        let textInAXFocusedElement = ""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        VimEngine.shared.enterNormalMode()       
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()        
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_but_not_on_an_empty_line_it_just_works_and_moves_to_the_previous_line() {
        let textInAXFocusedElement = """
caret is
gonna be at the end
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        VimEngine.shared.enterNormalMode()        
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [])
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 7)
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_and_on_an_empty_line_it_works_and_moves_up() {
        let textInAXFocusedElement = """
caret is on its
own empty
line

"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        VimEngine.shared.enterNormalMode()                
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()
        
        // real location will depend on GlobalColumnNumber, so we test that it moved up
        // we don't care where exactly on the previous line
        XCTAssertNotEqual(accessibilityElement?.caretLocation, 31)
    }
    
}


// TextViews
extension UIASNM_k_Tests {

    func test_that_in_normal_setting_k_goes_to_the_previous_line_at_the_same_column() {
        let textInAXFocusedElement = """
so now we're
testing k and
it should go up
to the same column
"""

        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])
        VimEngine.shared.enterNormalMode()

        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()

        XCTAssertEqual(accessibilityElement?.caretLocation, 38)
    }

    func test_that_if_the_previous_line_is_shorter_k_goes_to_the_end_of_line_limit_of_that_previous_line() {
        let textInAXFocusedElement = """
a line
shorter than
the previous shorter
than the previous shorter than...
"""

        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])
        VimEngine.shared.enterNormalMode()
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()

        XCTAssertEqual(accessibilityElement?.caretLocation, 39)
    }

    func test_that_the_column_number_is_saved_and_reapplied_properly() {
        let textInAXFocusedElement = """
first one is prettyyyyy long too
a pretty long line i would believe
a shorter line
another quite long line
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])
        VimEngine.shared.enterNormalMode()
        
        let firstK = applyMoveAndGetBackAccessibilityElement()
        XCTAssertEqual(firstK?.caretLocation, 81)
                        
        let secondK = applyMoveAndGetBackAccessibilityElement()
        XCTAssertEqual(secondK?.caretLocation, 51)
        
        let thirdK = applyMoveAndGetBackAccessibilityElement()
        XCTAssertEqual(thirdK?.caretLocation, 18)
    }
    
    func test_that_when_at_the_first_line_k_does_nothing() {
        let textInAXFocusedElement = """
a the first line
k should do
nothing ankulay
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [.command])
        VimEngine.shared.enterNormalMode()
                
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()

        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
    }
    
    func test_that_when_current_line_column_is_equal_to_previous_line_length_the_caret_ends_up_at_the_right_previous_line_end_limit() {
        let textInAXFocusedElement = """
weird bug when
current line column
is equal
to previ ous line length
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [.command])        
        VimEngine.shared.enterNormalMode()
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .e))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .e))
                
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()

        XCTAssertEqual(accessibilityElement?.caretLocation, 42)
    }

    func test_that_if_we_are_on_the_last_line_and_it_is_just_a_linefeed_we_can_still_go_up_and_follow_the_globalColumnNumber() {
        let textInAXFocusedElement = """
fucking hell
with the last line
empty

"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [])
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [])
        VimEngine.shared.enterNormalMode()
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .j))
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()

        XCTAssertEqual(accessibilityElement?.caretLocation, 33)
    }
    
}
