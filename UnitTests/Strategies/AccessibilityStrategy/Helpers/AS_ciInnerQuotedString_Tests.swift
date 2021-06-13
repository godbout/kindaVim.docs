@testable import kindaVim
import XCTest


// this function is used for for ci", ci', and ci` 
class AS_ciInnerQuotedString_Tests: AS_BaseTests {
    
    func test_that_if_the_caret_is_between_quotes_the_content_within_the_quotes_is_deleted_and_the_caret_moves() {
        let text = """
finally dealing with the "real stuff"!
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 30,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 38
            )
        )
        
        let returnedElement = accessibilityStrategy.ciInnerQuotedString(using: "\"", on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 26)
        XCTAssertEqual(returnedElement?.selectedLength, 10)
        XCTAssertEqual(returnedElement?.selectedText, "")
    }
        
    // currently "does not move" means we get back nil. getting back nil currently allows us
    // to not enter insert mode. this might change in the future. the system needs to be done better
    // (more consistently)
    func test_that_if_there_is_only_one_quote_no_content_is_deleted_and_the_caret_does_not_move() {
        let text = """
a text with only one quote ' lol
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 17,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 32
            )
        )
        
        let returnedElement = accessibilityStrategy.ciInnerQuotedString(using: "'", on: element)
        
        XCTAssertNil(returnedElement)
    }
    
    func test_that_if_there_are_no_quote_no_content_is_deleted_and_the_caret_does_not_move() {
        let text = "now no double quote at all"
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 8,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 26
            )
        )
        
        let returnedElement = accessibilityStrategy.ciInnerQuotedString(using: "'", on: element)
        
        XCTAssertNil(returnedElement)
    }
    
    func test_that_if_the_caret_is_before_the_quotes_then_the_content_within_is_deleted_and_the_caret_moves() {
        let text = """
now the caret is before the ` shit with ` backtick quotes
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 20,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 42
            )
        )
        
        let returnedElement = accessibilityStrategy.ciInnerQuotedString(using: "`", on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 29)
        XCTAssertEqual(returnedElement?.selectedLength, 11)
        XCTAssertEqual(returnedElement?.selectedText, "") 
    }
    
    func test_that_if_the_caret_is_after_the_quotes_then_no_content_is_deleted_and_the_caret_does_not_move() {
        let text = """
adding some lines on top because
it doesn't pass for long text
now the "caret" is after the quotes
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 85,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 63,
                end: 98
            )
        )
        
        let returnedElement = accessibilityStrategy.ciInnerQuotedString(using: "\"", on: element)
        
        XCTAssertNil(returnedElement)
    }
    
    func test_that_if_there_are_three_quotes_then_the_correct_content_is_deleted_and_the_caret_moves() {
        let text = """
that's ' three quotes ' in there
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 17,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 32
            )
        )
        
        let returnedElement = accessibilityStrategy.ciInnerQuotedString(using: "'", on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 8)
        XCTAssertEqual(returnedElement?.selectedLength, 14)
        XCTAssertEqual(returnedElement?.selectedText, "") 
    }
    
    // this is for now. but later this will have to be removed as the behavior when the caret
    // is at a double quote is more complicated than this
    func test_that_current_when_the_caret_is_at_the_last_quote_and_there_are_more_than_one_in_total_it_deletes_the_content() {
        let text = """
that's " three quotes " in there "
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 33,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 34
            )
        )
        
        let returnedElement = accessibilityStrategy.ciInnerQuotedString(using: "\"", on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 23)
        XCTAssertEqual(returnedElement?.selectedLength, 10)
        XCTAssertEqual(returnedElement?.selectedText, "") 
    }

}
