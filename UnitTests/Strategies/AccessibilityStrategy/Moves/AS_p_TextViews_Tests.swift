@testable import kindaVim
import XCTest


// ok so p for TextViews is more complex. because of the last yanking style (characterwise or linewise)
// we need, like O, to call the ATEAdaptor.toAXfocusedElement within the move to reposition correctly
// the caret after the move was done (remember, filling selectedText will move the caret).
// so we test here what we can, but most of the testing will have to be done through UI Tests
class AS_p_TextViews_Tests: AS_BaseTests {
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return accessibilityStrategy.p(on: element) 
    }
    
}


// the 3 special cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
extension AS_p_TextViews_Tests {
    
    func test_that_if_the_TextArea_is_empty_it_still_pastes() {
        let text = ""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 0,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: nil,
                start: nil,
                end: nil
            )
        )
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 1 of The 3 Cases for TextArea", forType: .string)
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 0)
        XCTAssertEqual(returnedElement?.selectedText, "test 1 of The 3 Cases for TextArea")
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextArea_it_does_nothing_and_does_not_crash() {
        let text = "the user has clicked out of the boundaries!"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 43,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: nil,
                start: nil,
                end: nil
            )
        )
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 2 of The 3 Cases for TextArea", forType: .string)
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 43)     
        XCTAssertNotEqual(returnedElement?.selectedText, "test 2 of The 3 Cases for TextArea")    
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextArea_and_on_an_empty_line_it_still_pastes() {
        let text = """
caret is on its
own empty
line

"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 31,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: nil,
                start: nil,
                end: nil
            )
        )
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 3 of The 3 Cases for TextArea", forType: .string)
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 31)
        XCTAssertEqual(returnedElement?.selectedText, "test 3 of The 3 Cases for TextArea")
    }    
    
}


// TextViews
extension AS_p_TextViews_Tests {
    
    func test_that_in_normal_setting_if_the_last_yanking_style_was_characterwise_it_pastes_the_content_inline() {        
        let text = """
gonna paste
some shit
down there
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 18,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 12,
                end: 22
            )
        )
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("paste paste paste", forType: .string)
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 19)
        XCTAssertEqual(returnedElement?.selectedText, "paste paste paste")
    }    
    
}
