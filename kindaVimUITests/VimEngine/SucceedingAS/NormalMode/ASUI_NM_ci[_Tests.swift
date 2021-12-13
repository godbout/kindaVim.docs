import XCTest
import KeyCombination
import AccessibilityStrategy


// see ci' for blah blah
class ASUI_NM_ciLeftBracket_Tests: ASUI_NM_BaseTests {

    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .i))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .leftBracket))
    }

}


extension ASUI_NM_ciLeftBracket_Tests {

    func test_that_in_normal_setting_it_succeeds_and_switches_to_insert_mode() {
        let textInAXFocusedElement = """
hoho [ another pile of shit ]
"""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        kindaVimEngine.enterNormalMode()
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .b))

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
    
    func test_that_when_the_text_is_not_empty_and_it_does_not_find_what_it_is_looking_for_it_stays_in_Normal_Mode() {
        let textInAXFocusedElement = """
hoho no bracket on that shit
"""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])
        kindaVimEngine.enterNormalMode()

        applyKeyCombinationsBeingTested()

        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }

}
