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


extension ASUI_NM_caw_Tests {

    func test_that_in_normal_setting_it_succeeds_and_switches_to_insert_mode() {
        let textInAXFocusedElement = "    of course we can find aWord in here!"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.command])
        kindaVimEngine.enterNormalMode()
        
        applyKeyCombinationsBeingTested()

        XCTAssertEqual(kindaVimEngine.currentMode, .insert)
    }

    func test_a_case_where_it_should_not_delete_the_content_and_then_stay_in_normal_mode() {
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
