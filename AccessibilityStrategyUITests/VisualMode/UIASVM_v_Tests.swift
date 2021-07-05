import XCTest


class UIASVM_v_Tests: UIAS_BaseTests {}


extension UIASVM_v_Tests {

    func test_that_the_caret_goes_to_the_head_location_when_coming_from_Visual_Mode_linewise() {
        let textInAXFocusedElement = "v after a V"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])
        VimEngine.shared.enterNormalMode()
        
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))
        let accessibilityElement = asVisualMode.v(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())

        XCTAssertEqual(accessibilityElement?.caretLocation, 10)
    }

    func test_that_the_caret_goes_to_the_head_location_after_having_being_switched_when_coming_from_Visual_Mode_linewise() {
        let textInAXFocusedElement = "v after a V"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])
        VimEngine.shared.enterNormalMode()

        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .o))
        let accessibilityElement = asVisualMode.v(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())

        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
    }
    
    func test_that_the_caret_goes_to_the_head_location_even_the_head_is_on_a_different_line_than_the_caret() {
        let textInAXFocusedElement = """
now we gonna have
the selection spread over
multiple lines
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)        
        VimEngine.shared.enterNormalMode()
        // the constellation of moves below can be replaced by better ones
        // once better ones are implemented
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .k))
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .k))
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .v))
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .e))
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .e))
        
        let accessibilityElement = asVisualMode.v(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 20)
    }

}
