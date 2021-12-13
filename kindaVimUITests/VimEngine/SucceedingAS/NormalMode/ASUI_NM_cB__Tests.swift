import KeyCombination
import XCTest


// this is only for `cB` and `cb`. if text is empty or if caret on first character, those moves don't work
// and Vim stays in `Normal Mode`. this does not happen for `ce/E`, `cw/W`. for those ones, Vim returns in
// `Insert Mode` LMAO. usual lack of consistency shit.
class UIASNM_cB__Tests: ASUI_NM_BaseTests {}


// Both
extension UIASNM_cB__Tests {

    func test_that_in_normal_setting_it_succeeds_and_switches_to_insert_mode() {
        let textInAXFocusedElement = """
this is some fine-ass stuff
"""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        
        kindaVimEngine.enterNormalMode()
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .B))

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
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .B))

        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }

}
