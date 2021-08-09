@testable import kindaVim
import XCTest


class ASUT_NM_o_Tests: ASNM_BaseTests {
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asNormalMode.o(on: element) 
    }
    
}


// TextFields
extension ASUT_NM_o_Tests {
    
    func test_that_for_a_TextField_it_does_nothing() {
        let text = "o shouldn't do anything in a TextField!"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 39,
            caretLocation: 18,
            selectedLength: 1,
            selectedText: "t",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 39
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertNil(returnedElement?.selectedText)
    }
    
}


// TextViews
extension ASUT_NM_o_Tests {
    
    func test_that_in_normal_setting_it_creates_a_new_line() {
        let text = """
that's a multiline
and o will
create a new line
below
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 53,
            caretLocation: 38,
            selectedLength: 1,
            selectedText: " ",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 3,
                start: 30,
                end: 48
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.selectedLength, 9)
        XCTAssertEqual(returnedElement?.selectedText, " new line\n")        
    }
    
    func test_that_the_caret_goes_to_the_same_spaces_indentation_as_the_previous_line_on_the_newly_create_line() {
        let text = """
like
    there's some space
so the new line follows that
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 56,
            caretLocation: 21,
            selectedLength: 1,
            selectedText: " ",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 5,
                end: 28
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.selectedLength, 6)
        XCTAssertEqual(returnedElement?.selectedText, " space\n    ")            
    }
    
    func test_that_if_on_the_last_line_it_does_not_cut_and_put_the_last_character_on_the_next_new_line() {
        let text = """
it should not cut the last character
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 36,
            caretLocation: 25,
            selectedLength: 1,
            selectedText: "t",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 36
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.selectedLength, 11)
        XCTAssertEqual(returnedElement?.selectedText, "t character\n")        
        
    }
    
    func test_that_if_on_the_last_empty_line_it_does_create_a_new_line() {
        let text = """
caret on empty last line

"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 25,
            caretLocation: 25,
            selectedLength: 0,
            selectedText: "",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 25,
                end: 25
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.selectedLength, 0)
        XCTAssertEqual(returnedElement?.selectedText, "\n")   
    }
    
    func test_that_if_on_a_line_that_is_just_a_linefeed_it_does_create_one_line_and_goes_to_that_line_not_two_lines_below() {
        let text = """
two lines empty below


"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 23,
            caretLocation: 22,
            selectedLength: 0,
            selectedText: "",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 22,
                end: 23
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.selectedLength, 0)
        XCTAssertEqual(returnedElement?.selectedText, "\n")   
    }
    
}


// emojis
extension ASUT_NM_o_Tests {
    
    func test_that_it_handles_emojis() {
        let text = """
need🍃️🍃️🍃️ to deal wi🛩️🛩️th
those 🍃️🍃️🍃️🍃️🍃️🍃️ faces 🥺️☹️😂️
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 72,
            caretLocation: 19,
            selectedLength: 1,
            selectedText: "a",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 33
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 19)
        XCTAssertEqual(returnedElement?.selectedLength, 13)
        XCTAssertEqual(returnedElement?.selectedText, "al wi🛩️🛩️th\n")
    }
    
}



