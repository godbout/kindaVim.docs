import KeyCombination
import XCTest


// see `cB` for blah blah
class UIASNM_cb_Tests: ASUI_NM_BaseTests {}


// Both
extension UIASNM_cb_Tests {

    func test_that_in_normal_setting_it_succeeds_and_switches_to_insert_mode() {
        let textInAXFocusedElement = """
this is some fine-ass stuff
"""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        
        kindaVimEngine.enterNormalMode()
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .b))

        XCTAssertEqual(kindaVimEngine.currentMode, .insert)
    }

    func test_a_case_where_it_should_not_delete_the_content_stays_in_normal_mode() {
        let textInAXFocusedElement = """
can't delete if we're on the first letter of a text hehe
"""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        kindaVimEngine.enterNormalMode()
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .zero))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .c))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .b))

        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }

}
