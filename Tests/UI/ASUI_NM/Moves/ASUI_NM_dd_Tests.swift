@testable import kindaVim
import KeyCombination
import XCTest


class UIASNM_dd_Tests: ASUI_NM_BaseTests {
    
    private func applyMoveAndGetBackAccessibilityElement() -> AccessibilityTextElement? {
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .d))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .d))
        
        return AccessibilityTextElementAdaptor.fromAXFocusedElement()
    }
    
}


// TextFields
extension UIASNM_dd_Tests {
    
    func test_that_in_normal_setting_it_deletes_the_whole_line() {
        let textInAXFocusedElement = "this is a line to be deleted"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.value, "")        
        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
    }
    
    func test_that_if_the_line_is_empty_it_does_not_crash() {
        let textInAXFocusedElement = ""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.value, "")        
        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
    }

}


// TextViews
extension UIASNM_dd_Tests {
    
    func test_that_it_normal_setting_it_deletes_the_whole_line() {
        let textInAXFocusedElement = """
the caret should go down
to the next line
somehow
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [.command])
        KindaVimEngine.shared.enterNormalMode()
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.value, "to the next line\nsomehow")        
        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
    }
    
    func test_that_it_skips_the_spaces_on_the_next_line_and_that_it_therefore_keeps_the_indentation() {
        let textInAXFocusedElement = """
if someBullshit == true {
    bs = yeah
}
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [.command])
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [.option])
        KindaVimEngine.shared.enterNormalMode()
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.value, "    bs = yeah\n}")        
        XCTAssertEqual(accessibilityElement?.caretLocation, 4)
    }
    
    func test_that_it_skips_the_tabs_on_the_next_line_and_that_it_therefore_keeps_the_indentation() {
        let textInAXFocusedElement = """
if someBullshit == true {
\tbs = yeah
}
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [.command])
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [.option])
        KindaVimEngine.shared.enterNormalMode()
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.value, "\tbs = yeah\n}")        
        XCTAssertEqual(accessibilityElement?.caretLocation, 1)
    }
    
    func test_that_when_it_deletes_a_line_it_ends_up_at_the_correct_indentation_on_the_next_line() {
        let textInAXFocusedElement = """
for example
  it should stop
after the two spaces
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [.command])
        KindaVimEngine.shared.enterNormalMode()
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.value, "  it should stop\nafter the two spaces")        
        XCTAssertEqual(accessibilityElement?.caretLocation, 2)            
    }
    
    func test_that_if_on_the_last_line_it_deletes_the_line_and_goes_up_to_the_first_non_blank_of_the_previous_line() {
        let textInAXFocusedElement = """
this one
    is a tough
one
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.value, "this one\n    is a tough")        
        XCTAssertEqual(accessibilityElement?.caretLocation, 13)   
    }
    
    func test_that_the_caret_ends_up_at_the_next_line_end_limit_if_the_next_line_is_just_made_out_of_non_blank_characters() {
        let textInAXFocusedElement = """
if the next line is just blank characters
then there is no firstNonBlank so we need
          
to stop at the end limit of the line
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        app.textViews.firstMatch.typeKey(.upArrow , modifierFlags: [])
        KindaVimEngine.shared.enterNormalMode()
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.value, """
if the next line is just blank characters
          
to stop at the end limit of the line
"""
        )        
        XCTAssertEqual(accessibilityElement?.caretLocation, 51)
    }
    
    func test_that_if_the_next_line_is_only_blanks_the_caret_goes_to_the_limit_of_the_line_before_the_linefeed() {
        let textInAXFocusedElement = """
we gonna use VM
dd here and we suppose
      to go to non blank of the line
         
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        KindaVimEngine.shared.enterNormalMode()
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.value, """
we gonna use VM
dd here and we suppose
         
"""
        )
        XCTAssertEqual(accessibilityElement?.caretLocation, 47)    
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_and_on_an_empty_line_it_works_and_the_caret_goes_to_the_relevant_position() {
        let textInAXFocusedElement = """
caret is on its
own empty
    line

"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [])
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.value, """
caret is on its
own empty
    line
"""
        )
        XCTAssertEqual(accessibilityElement?.caretLocation, 30)
    }
    
}


// emojis
extension UIASNM_dd_Tests {
    
    func test_that_it_handles_emojis() {
        let textInAXFocusedElement = """
wow now that 😂️😂️😂️ have to handle🙈️
    🍌️dd with the 🙈️🙈️🙈️🙈️🙈️🙈️🙈️ emojis🍌️🍌️
  and i don't really 🍌️🍌️🍌️ know it it works🍌️
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .k))
        
        let accessibilityElement = applyMoveAndGetBackAccessibilityElement()
        
        XCTAssertEqual(accessibilityElement?.value, """
wow now that 😂️😂️😂️ have to handle🙈️
  and i don't really 🍌️🍌️🍌️ know it it works🍌️
"""
        )
        XCTAssertEqual(accessibilityElement?.caretLocation, 43)
    }
    
}
