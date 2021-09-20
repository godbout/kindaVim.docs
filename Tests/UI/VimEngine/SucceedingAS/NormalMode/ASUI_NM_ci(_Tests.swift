@testable import kindaVim
import XCTest
import KeyCombination
import AccessibilityStrategy


// see ci" for blah blah
class ASUI_NM_ciLeftParenthesis_Tests: ASUI_NM_BaseTests {

    private func applyKeyCombinationsBeingTested() {
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .c))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .i))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .leftParenthesis))
    }

}


extension ASUI_NM_ciLeftParenthesis_Tests {

    func test_that_in_normal_setting_it_succeeds_and_switches_to_insert_mode() {
        let textInAXFocusedElement = """
hoho ( another pile of shit )
"""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .b))

        applyKeyCombinationsBeingTested()

        XCTAssertEqual(KindaVimEngine.shared.currentMode, .insert)
    }
    
    func test_a_case_where_it_should_not_delete_the_content_and_then_stay_in_normal_mode() {
        let textInAXFocusedElement = """
hoho no bracket on that shit
"""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])
        KindaVimEngine.shared.enterNormalMode()

        applyKeyCombinationsBeingTested()

        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }

}
