@testable import kindaVim
import XCTest


class UIASNM_gg_Tests: ASUI_NM_BaseTests {
    
    private func applyMoveAndGetBackAccessibilityElement() -> AccessibilityTextElement? {
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .g))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .g))
        
        return AccessibilityTextElementAdaptor.fromAXFocusedElement()
    }
    
}


// TextFields
extension UIASNM_gg_Tests {
    
    func test_that_it_goes_to_the_beginning_of_the_line_if_it_starts_with_non_blank() {
        let textInAXFocusedElement = "a normal sentence"
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
    }
    
    func test_that_it_goes_to_the_first_non_blank_of_the_line() {
        let textInAXFocusedElement = "      😀️g should go to 😀️"
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 6)
        XCTAssertEqual(accessibilityElement?.selectedLength, 3)
    }
    
    func test_that_it_goes_to_the_end_limit_of_the_line_if_there_is_no_non_blank() {
        let textInAXFocusedElement = "         "
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 8)
    }
    
}


// TextViews
extension UIASNM_gg_Tests {
    
    func test_that_it_goes_to_the_first_character_of_the_TextView_if_it_starts_with_non_blank() {
        let textInAXFocusedElement = """
a beautiful poem
right
here
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
    }
    
    func test_that_it_goes_to_the_first_non_blank_of_the_TextView() {
        let textInAXFocusedElement = """
   a couple of spaces
then a lot
of
bullshit
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 3)
    }
    
    func test_that_it_works_with_an_empty_first_line() {
        let textInAXFocusedElement = """

first line is
completely empty
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
    }
    
    func test_that_it_stops_at_the_end_limit_when_the_first_line_is_just_spaces() {
        let textInAXFocusedElement = """
        
lol lots of spaces
again only
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 7)
    }
    
}
