import XCTest
import KeyCombination
import AccessibilityStrategy


// see yi' for blah blah
class ASUI_NM_yiDoubleQuote_Tests: ASUI_NM_BaseTests {

    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .y))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .i))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .doubleQuote))
    }

}


// LastYankStyle
extension ASUI_NM_yiDoubleQuote_Tests {
    
    func test_that_when_it_finds_it_sets_the_LastYankStyle_to_Characterwise() {
        let textInAXFocusedElement = """
hehe there's gonna be some "double quotes" in that shit
"""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.command])
        kindaVimEngine.enterNormalMode()
        kindaVimEngine.lastYankStyle = .linewise
               
        applyKeyCombinationsBeingTested()

        XCTAssertEqual(kindaVimEngine.lastYankStyle, .characterwise)
    }
    
    func test_that_when_it_does_not_find_it_does_not_touch_the_LastYankStyle() {
        let textInAXFocusedElement = """
huhu only one " in there...
"""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])
        kindaVimEngine.enterNormalMode()
        kindaVimEngine.lastYankStyle = .linewise
               
        applyKeyCombinationsBeingTested()

        XCTAssertEqual(kindaVimEngine.lastYankStyle, .linewise)
    }
    
}
