import XCTest


class UIASVM_v_Tests: UIAS_BaseTests {}


extension UIASVM_v_Tests {

    func test_that_the_caret_goes_to_the_head_location_when_coming_from_Visual_Mode_linewise() {
        let textInAXFocusedElement = "v after a V"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v, shift: true))
        let accessibilityElement = asVisualMode.v(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())

        XCTAssertEqual(accessibilityElement?.caretLocation, 10)
    }

    func test_that_the_caret_goes_to_the_head_location_after_having_being_switched_when_coming_from_Visual_Mode_linewise() {
        let textInAXFocusedElement = "v after a V"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])

        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v, shift: true))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .o))
        let accessibilityElement = asVisualMode.v(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())

        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
    }

}
