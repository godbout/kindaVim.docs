import XCTest
import KeyCombination
import AccessibilityStrategy


// see ci" for blah blah
class ASUI_NM_caw_Tests: ASUI_NM_BaseTests {

    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .a))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .w))
    }

}


// LastYankStyle
extension ASUI_NM_caw_Tests {
    
    func test_that_when_it_finds_aWord_it_sets_the_LastYankStyle_to_Characterwise() {
        let textInAXFocusedElement = "    of course we can find aWord in here!"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.command])
        kindaVimEngine.enterNormalMode()
        kindaVimEngine.lastYankStyle = .linewise
               
        applyKeyCombinationsBeingTested()

        XCTAssertEqual(kindaVimEngine.lastYankStyle, .characterwise)
    }
    
    func test_that_when_it_does_not_find_aWord_it_does_not_touch_the_LastYankStyle() {
        let textInAXFocusedElement = "caw does not work here...               "
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [])
        kindaVimEngine.enterNormalMode()
        kindaVimEngine.lastYankStyle = .linewise
               
        applyKeyCombinationsBeingTested()

        XCTAssertEqual(kindaVimEngine.lastYankStyle, .linewise)
    }
    
}


extension ASUI_NM_caw_Tests {

    func test_that_in_normal_setting_it_succeeds_and_switches_to_InsertMode() {
        let textInAXFocusedElement = "    of course we can find aWord in here!"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.command])
        kindaVimEngine.enterNormalMode()
        
        applyKeyCombinationsBeingTested()

        XCTAssertEqual(kindaVimEngine.currentMode, .insert)
    }
    
    func test_that_when_the_text_is_empty_it_stays_in_NormalMode() {
        let textInAXFocusedElement = ""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        kindaVimEngine.enterNormalMode()
        
        applyKeyCombinationsBeingTested()

        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }

    func test_that_when_the_text_is_not_empty_and_the_caret_is_on_a_space_and_all_the_rest_of_the_text_is_spaces_it_stays_in_Normal_Mode() {
        let textInAXFocusedElement = "caw does not work here...               "
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [])
        kindaVimEngine.enterNormalMode()

        applyKeyCombinationsBeingTested()

        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }

}


// special case. even if failing (selectedText == nil), caw will move the caretLocation (to the end of the text)
// so push(element) needs to be called. this test makes sure this is called and we end up with the correct element.
extension ASUI_NM_caw_Tests {

    func test_that_the_element_is_correct_even_if_the_move_returned_a_selectedText_of_nil() {
        let textInAXFocusedElement = "caw does not work here...               "
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [])
        kindaVimEngine.enterNormalMode()

        applyKeyCombinationsBeingTested()
        
        let focusedElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(focusedElement?.caretLocation, 39)
        XCTAssertEqual(focusedElement?.selectedLength, 1)
        XCTAssertEqual(focusedElement?.selectedText, " ")
    }
    
}
