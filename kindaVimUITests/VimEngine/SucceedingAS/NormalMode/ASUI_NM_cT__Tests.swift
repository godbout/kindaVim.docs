import KeyCombination
import XCTest


class ASUI_NM_cT__Tests: ASUI_NM_BaseTests {}


// LastYankStyle
extension ASUI_NM_cT__Tests {
    
    func test_that_when_it_finds_it_sets_the_LastYankStyle_to_Characterwise() {
        let textInAXFocusedElement = """
cT is pretty cool
"""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [])
        kindaVimEngine.enterNormalMode()
        kindaVimEngine.lastYankStyle = .linewise

        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .T))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .p))

        XCTAssertEqual(kindaVimEngine.lastYankStyle, .characterwise)
    }
    
    func test_that_when_it_does_not_find_it_does_not_change_the_LastYankStyle() {
        let textInAXFocusedElement = """
hehe can't use cT here with the last letter of the alphabet!
"""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])
        kindaVimEngine.enterNormalMode()
        kindaVimEngine.lastYankStyle = .linewise

        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .T))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .z))

        XCTAssertEqual(kindaVimEngine.lastYankStyle, .linewise)
    }
    
}


// Both
extension ASUI_NM_cT__Tests {

    func test_that_in_normal_setting_it_succeeds_and_switches_to_insert_mode() {
        let textInAXFocusedElement = """
cT is pretty cool
"""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [])
        kindaVimEngine.enterNormalMode()

        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .T))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .p))

        XCTAssertEqual(kindaVimEngine.currentMode, .insert)
    }
    
    func test_that_when_the_text_is_empty_it_stays_in_Normal_Mode() {
        let textInAXFocusedElement = ""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        kindaVimEngine.enterNormalMode()
                
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .T))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .z))

        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }

    func test_that_when_the_text_is_not_empty_and_it_does_not_find_what_it_is_looking_for_it_stays_in_Normal_Mode() {
        let textInAXFocusedElement = """
hehe can't use cT here with the last letter of the alphabet!
"""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])
        kindaVimEngine.enterNormalMode()

        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .T))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .z))

        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }

}
