@testable import kindaVim
import XCTest


class ASNM_C__Tests: ASNM_BaseTests {
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asNormalMode.C(on: element) 
    }
    
}


// TextField
extension ASNM_C__Tests {
    
    func test_that_in_normal_setting_it_deletes_from_the_caret_to_the_end_of_the_line() {
        let text = "C should delete from the caret to the end of the line"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 53,
            caretLocation: 28,
            selectedLength: 1,
            selectedText: "e",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 53
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 28)
        XCTAssertEqual(returnedElement?.selectedLength, 25)
        XCTAssertEqual(returnedElement?.selectedText, "")
    }
    
}


// TextViews
extension ASNM_C__Tests {
    
    func test_that_in_normal_setting_it_deletes_from_the_caret_to_before_the_linefeed_at_the_end_of_the_line() {
        let text = """
C should delete the second line
but without the linefeed!
else everything gonna stuck
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 85,
            caretLocation: 40,
            selectedLength: 1,
            selectedText: "o",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 32,
                end: 58
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 40)
        XCTAssertEqual(returnedElement?.selectedLength, 17)
        XCTAssertEqual(returnedElement?.selectedText, "")
    }
    
    func test_that_it_does_not_delete_the_linefeed_even_for_an_empty_line() {
        let text = """
now we have an empty line

and that shouldn't be deleted by C
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 61,
            caretLocation: 26,
            selectedLength: 1,
            selectedText: "\n",
            currentLine: AccessibilityTextElementLine(
            fullValue: text,
            number: 2,
            start: 26,
            end: 27
            )
            )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 26)
        XCTAssertEqual(returnedElement?.selectedLength, 0)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
}


// emojis
extension ASNM_C__Tests {
    
    func test_that_it_handles_emojis() {
        let text = """
need to deal with
those faces 🥺️☹️😂️
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 38,
            caretLocation: 33,
            selectedLength: 1,
            selectedText: "a",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 18,
                end: 38
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 33)
        XCTAssertEqual(returnedElement?.selectedLength, 5)
        XCTAssertEqual(returnedElement?.selectedText, "")
    }
    
}
