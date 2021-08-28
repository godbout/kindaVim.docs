@testable import kindaVim
import KeyCombination
import XCTest


// ciw uses only the TextEngine.innerWord func.
// this is already tested, so here we have only a bunch of
// tests for extra caution, but most of them are already done
// in TE.innerWord
class ASNM_ciw_Tests: ASNM_BaseTests {
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asNormalMode.ciw(on: element) 
    }
    
}


// Both
extension ASNM_ciw_Tests {
    
    func test_that_it_can_delete_a_word_separated_by_spaces() {
        let text = "a sentence with a word, or more..."
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 34,
            caretLocation: 12,
            selectedLength: 1,
            selectedText: "i",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 34
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 11)
        XCTAssertEqual(returnedElement?.selectedLength, 4)
        XCTAssertEqual(returnedElement?.selectedText, "")      
    }    
    
    func test_that_it_deletes_a_single_space_when_the_space_is_alone() {
        let text = "a sentence with a word, or more..."
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 34,
            caretLocation: 15,
            selectedLength: 1,
            selectedText: " ",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 34
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 15)
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertEqual(returnedElement?.selectedText, "")      
    }
    
    func test_that_it_deletes_up_to_the_beginning_of_a_line() {
        let text = "         hehehehe"
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 17,
            caretLocation: 6,
            selectedLength: 1,
            selectedText: " ",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 17
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 0)
        XCTAssertEqual(returnedElement?.selectedLength, 9)
        XCTAssertEqual(returnedElement?.selectedText, "")     
    }
    
}


// TextViews
extension ASNM_ciw_Tests {
    
    func test_that_it_stops_at_linefeeds() {
        let text = """
can't go from
one line to      
    the other
"""   
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 45,
            caretLocation: 27,
            selectedLength: 1,
            selectedText: " ",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 14,
                end: 32
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 25)
        XCTAssertEqual(returnedElement?.selectedLength, 6)
        XCTAssertEqual(returnedElement?.selectedText, "")     
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_and_on_an_empty_line_it_works_and_deletes_the_last_character_of_the_previous_line() {        
        let text = """
caret is on its
own empty
line

"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 31,
            caretLocation: 31,
            selectedLength: 0,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 4,
                start: 31,
                end: 31
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 29)
        XCTAssertEqual(returnedElement?.selectedLength, 2)
        XCTAssertEqual(returnedElement?.selectedText, "")
    }
    
}


// emojis
extension ASNM_ciw_Tests {
    
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
            selectedLength: 0,
            selectedText: "",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 18,
                end: 38
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 30)
        XCTAssertEqual(returnedElement?.selectedLength, 8)
        XCTAssertEqual(returnedElement?.selectedText, "")
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_and_on_an_empty_line_it_works_and_deletes_the_last_character_of_the_previous_line_even_if_it_is_an_emoji() {        
        let text = """
caret is on its
own empty
line 📆️

"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 35,
            caretLocation: 35,
            selectedLength: 0,
            selectedText: "",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 4,
                start: 35,
                end: 35
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 31)
        XCTAssertEqual(returnedElement?.selectedLength, 4)
        XCTAssertEqual(returnedElement?.selectedText, "")
    }
    
    func test_that_it_does_suck_the_emojis_before_a_space_when_we_are_at_a_space() {        
        let text = "don't suck 🦆️   me   "
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 22,
            caretLocation: 15,
            selectedLength: 1,
            selectedText: " ",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 22
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 14)
        XCTAssertEqual(returnedElement?.selectedLength, 3)
        XCTAssertEqual(returnedElement?.selectedText, "")
    }
    
}
