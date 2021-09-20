@testable import kindaVim
import XCTest
import KeyCombination
import AccessibilityStrategy


// see ci" for blah blah
class ASUI_NM_caw_Tests: ASUI_NM_BaseTests {

    private func applyKeyCombinationsBeingTested() {
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .c))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .a))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .w))
    }

}


extension ASUI_NM_caw_Tests {

    func test_that_in_normal_setting_it_succeeds_and_switches_to_insert_mode() {
        let textInAXFocusedElement = "    of course we can find aWord in here!"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.command])
        KindaVimEngine.shared.enterNormalMode()
        
        applyKeyCombinationsBeingTested()

        XCTAssertEqual(KindaVimEngine.shared.currentMode, .insert)
    }

    func test_a_case_where_it_should_not_delete_the_content_and_then_stay_in_normal_mode() {
        let textInAXFocusedElement = "caw does not work here...               "
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [])
        KindaVimEngine.shared.enterNormalMode()

        applyKeyCombinationsBeingTested()

        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }

}
