import XCTest
import KeyCombination
import AccessibilityStrategy


// see yi' for blah blah
class ASUI_NM_yt_Tests: ASUI_NM_BaseTests {

    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .y))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .t))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .percent))
    }

}


// LastYankStyle
extension ASUI_NM_yt_Tests {
    
    func test_that_when_it_finds_it_sets_the_LastYankStyle_to_Characterwise() {
        let textInAXFocusedElement = """
there's a % in here 
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
there's no... hahahha in here
"""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.command])
        kindaVimEngine.enterNormalMode()
        kindaVimEngine.lastYankStyle = .linewise
               
        applyKeyCombinationsBeingTested()

        XCTAssertEqual(kindaVimEngine.lastYankStyle, .linewise)
    }
    
}
