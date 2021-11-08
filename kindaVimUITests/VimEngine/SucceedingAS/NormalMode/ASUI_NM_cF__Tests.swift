import KeyCombination
import XCTest


class UIASNM_cF__Tests: ASUI_NM_BaseTests {}


// Both
extension UIASNM_cF__Tests {

    func test_that_in_normal_setting_it_succeeds_and_switches_to_insert_mode() {
        let textInAXFocusedElement = """
cF is pretty cool
"""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        
        kindaVimEngine.enterNormalMode()
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .F))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .p))

        XCTAssertEqual(kindaVimEngine.currentMode, .insert)
    }

    func test_a_case_where_it_should_not_delete_the_content_stays_in_normal_mode() {
        let textInAXFocusedElement = """
hehe can't use cF here with the last letter of the alphabet!
"""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        kindaVimEngine.enterNormalMode()
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .F))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .z))

        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }

}
