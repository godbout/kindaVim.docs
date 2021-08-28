@testable import kindaVim
import KeyCombination
import XCTest


class ASNM_cc_Tests: ASNM_BaseTests {
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asNormalMode.cc(on: element) 
    }
    
}


// Both
extension ASNM_cc_Tests {
    
    func test_that_in_normal_setting_it_deletes_the_whole_line() {
        let text = "this is a single line"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 21,
            caretLocation: 13,
            selectedLength: 1,
            selectedText: "g",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 21
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 0)
        XCTAssertEqual(returnedElement?.selectedLength, 21)
        XCTAssertEqual(returnedElement?.selectedText, "")
    }
    
}


// TextViews
extension ASNM_cc_Tests {
    
    func test_that_in_normal_setting_it_deletes_the_whole_correct_line() {
        let text = """
should delete
the right line
lol
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 32,
            caretLocation: 23,
            selectedLength: 1,
            selectedText: " ",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 14,
                end: 29
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 14)
        XCTAssertEqual(returnedElement?.selectedLength, 14)
        XCTAssertEqual(returnedElement?.selectedText, "")
    }
    
    func test_that_it_should_keep_the_indentation_of_the_current_line() {
        let text = """
   i delete a line
but the indent should
be kept
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 48,
            caretLocation: 10,
            selectedLength: 1,
            selectedText: "e",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 19
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 3)
        XCTAssertEqual(returnedElement?.selectedLength, 15)
        XCTAssertEqual(returnedElement?.selectedText, "")
    }
}


// emojis
extension ASNM_cc_Tests {
    
    func test_that_it_handles_emojis() {
        let text = """
need to deal with
those faces 🥺️☹️😂️
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 38,
            caretLocation: 21,
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
        
        XCTAssertEqual(returnedElement?.caretLocation, 18)
        XCTAssertEqual(returnedElement?.selectedLength, 20)
        XCTAssertEqual(returnedElement?.selectedText, "")
    }
    
}

