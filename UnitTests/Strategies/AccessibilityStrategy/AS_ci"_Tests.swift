@testable import kindaVim
import XCTest

// TODO: there is more to do here
// there's a special case of when the caret is on a quote
// rather than mindlessly deleting what's between the previous and the current quote
// vim will actually calculate the pairs from the start. so if you're on the third quote,
// vim will not delete what's between the second and first, but will look for a fourth, not find
// it and do nothing. tough
class AS_ciDoubleQuote_Tests: AS_BaseTests {}

// Both
extension AS_ciDoubleQuote_Tests {
    
    func test_that_if_the_caret_is_between_double_quotes_the_content_within_the_quotes_is_deleted_and_the_caret_moves() {
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
        
        let returnedElement = accessibilityStrategy.ciDoubleQuote(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 26)
        XCTAssertEqual(returnedElement?.selectedLength, 10)
        XCTAssertEqual(returnedElement?.selectedText, "")
    }
    
    // currently "does not move" means we get back nil. getting back nil currently allows us
    // to not enter insert mode. this might change in the future. the system needs to be done better
    // (more consistently)
    func test_that_if_there_is_only_one_double_quote_no_content_is_deleted_and_the_caret_does_not_move() {
        let text = """
a text with only one quote " lol
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
        
        let returnedElement = accessibilityStrategy.ciDoubleQuote(on: element)
        
        XCTAssertNil(returnedElement)
    }
    
    func test_that_if_there_are_no_double_quote_no_content_is_deleted_and_the_caret_does_not_move() {
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
        
        let returnedElement = accessibilityStrategy.ciDoubleQuote(on: element)
        
        XCTAssertNil(returnedElement)
    }
    
    func test_that_if_the_caret_is_before_the_double_quotes_then_the_content_within_is_deleted_and_the_caret_moves() {
        let text = """
now the caret is before the " shit with " double quotes
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 0,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 42
            )
        )
        
        let returnedElement = accessibilityStrategy.ciDoubleQuote(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 29)
        XCTAssertEqual(returnedElement?.selectedLength, 11)
        XCTAssertEqual(returnedElement?.selectedText, "") 
    }
    
    func test_that_if_the_caret_is_after_the_double_quotes_then_no_content_is_deleted_and_the_caret_does_not_move() {
        let text = """
now the "caret" is after the quotes
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 22,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 35
            )
        )
        
        let returnedElement = accessibilityStrategy.ciDoubleQuote(on: element)
        
        XCTAssertNil(returnedElement)
    }
    
    func test_that_if_there_are_three_double_quotes_then_the_correct_content_is_deleted_and_the_caret_moves() {
        let text = """
that's " three quotes " in there "
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 20,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 34
            )
        )
        
        let returnedElement = accessibilityStrategy.ciDoubleQuote(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 8)
        XCTAssertEqual(returnedElement?.selectedLength, 14)
        XCTAssertEqual(returnedElement?.selectedText, "") 
    }
  
}
