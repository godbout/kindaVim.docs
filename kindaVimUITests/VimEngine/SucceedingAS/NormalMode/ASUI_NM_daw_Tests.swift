import XCTest
import KeyCombination
import AccessibilityStrategy


class ASUI_NM_daw_Tests: ASUI_NM_BaseTests {

    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .d))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .a))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .w))
    }

}


// LastYankStyle
extension ASUI_NM_daw_Tests {
    
    func test_that_when_it_finds_it_sets_the_LastYankStyle_to_Characterwise() {
        let textInAXFocusedElement = """
of course he gonna find some shit in there
"""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.command])
        kindaVimEngine.enterNormalMode()
        kindaVimEngine.lastYankStyle = .linewise
               
        applyKeyCombinationsBeingTested()

        XCTAssertEqual(kindaVimEngine.lastYankStyle, .characterwise)
    }
    
    func test_that_when_it_does_not_find_it_does_not_change_the_LastYankStyle() {
        let textInAXFocusedElement = """
no shit in there                 
"""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [])
        kindaVimEngine.enterNormalMode()
        kindaVimEngine.lastYankStyle = .linewise
               
        applyKeyCombinationsBeingTested()

        XCTAssertEqual(kindaVimEngine.lastYankStyle, .linewise)
    }
    
}
