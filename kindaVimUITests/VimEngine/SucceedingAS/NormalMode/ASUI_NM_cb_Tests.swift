import KeyCombination
import XCTest


// see `cB` for blah blah
class UIASNM_cb_Tests: ASUI_NM_BaseTests {
    
    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .b))
    }
}


// Both
extension UIASNM_cb_Tests {

    func test_that_in_normal_setting_it_succeeds_and_switches_to_insert_mode() {
        let textInAXFocusedElement = """
this is some fine-ass stuff
"""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        kindaVimEngine.enterNormalMode()
        
        applyKeyCombinationsBeingTested()

        XCTAssertEqual(kindaVimEngine.currentMode, .insert)
    }
    
    func test_that_when_the_text_is_empty_it_stays_in_Normal_Mode() {
        let textInAXFocusedElement = ""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        kindaVimEngine.enterNormalMode()
                
        applyKeyCombinationsBeingTested()

        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }

    func test_that_when_the_text_is_not_empty_and_the_caret_is_at_the_first_character_of_the_text_it_stays_in_Normal_Mode() {
        let textInAXFocusedElement = """
can't delete if we're on the first letter of a text hehe
"""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        kindaVimEngine.enterNormalMode()
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .zero))
                
        applyKeyCombinationsBeingTested()

        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }

}
