@testable import kindaVim
import XCTest


// used by yi`, yi', yi"
class ASNM_yiInnerQuotedString_Tests: ASNM_BaseTests {
    
    private func applyMove(using quote: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asNormalMode.yiInnerQuotedString(using: quote, on: element) 
    }
    
}


// Both
extension ASNM_yiInnerQuotedString_Tests {
    
    func test_that_there_is_no_quote_it_does_not_move_or_copy_anything() {
        let text = "some text without any double quote"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 34,
            caretLocation: 23,
            selectedLength: 1,
            selectedText: "o",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 34
            )
        )
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("no double quote", forType: .string)
        
        let returnedElement = applyMove(using: "\"", on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "no double quote")
        XCTAssertEqual(returnedElement?.caretLocation, 23)
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
    func test_that_there_is_only_one_quote_it_does_not_move_or_copy_anything_either() {
        let text = """
now there's one " double quote
"""
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 30,
            caretLocation: 12,
            selectedLength: 1,
            selectedText: "o",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 30
            )
        )
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("only one double quote", forType: .string)
        
        let returnedElement = applyMove(using: "\"", on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "only one double quote")
        XCTAssertEqual(returnedElement?.caretLocation, 12)
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
    func test_that_if_there_are_two_quotes_and_the_caret_is_before_them_then_it_moves_the_caret_and_copy_the_text() {
        let text = """
now there's
two 'simple quotes' on the second line
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 50,
            caretLocation: 14,
            selectedLength: 1,
            selectedText: "o",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 12,
                end: 50
            )
        )
        
        let returnedElement = applyMove(using: "'", on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "simple quotes")
        XCTAssertEqual(returnedElement?.caretLocation, 17)  
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
    func test_that_if_there_are_two_quotes_and_the_caret_is_between_them_then_it_moves_the_caret_and_copy_the_text() {
        let text = """
again multiline
again
and now `hohohohoho`
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 42,
            caretLocation: 37,
            selectedLength: 1,
            selectedText: "h",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 3,
                start: 22,
                end: 42
            )
        )
        
        let returnedElement = applyMove(using: "`", on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "hohohohoho")
        XCTAssertEqual(returnedElement?.caretLocation, 31)  
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
    func test_that_if_there_are_two_quotes_and_the_caret_is_after_them_then_it_does_not_move_or_copy_anything() {
        let text = """
double "quotes" before the caret
"""
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 32,
            caretLocation: 26,
            selectedLength: 1,
            selectedText: " ",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 32
            )
        )
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("caret after double quote", forType: .string)
        
        let returnedElement = applyMove(using: "\"", on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "caret after double quote")
        XCTAssertEqual(returnedElement?.caretLocation, 26)  
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
    func test_that_if_there_are_three_double_quotes_and_the_caret_is_not_after_all_of_them_then_it_moves_the_caret_and_copy_the_right_text() {
        let text = """
heheheheh
'quote' and some more' yeyeyeye
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 41,
            caretLocation: 30,
            selectedLength: 1,
            selectedText: "e",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 10,
                end: 41
            )
        )
        
        let returnedElement = applyMove(using: "'", on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), " and some more")
        XCTAssertEqual(returnedElement?.caretLocation, 17)  
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
    func test_that_if_there_are_four_quotes_and_the_caret_is_exactly_on_the_third_one_it_calculates_the_matching_pairs_and_copy_the_right_text() {
        let text = """
now there's gonna
`be` for `quotes` yep
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 39,
            caretLocation: 27,
            selectedLength: 1,
            selectedText: "`",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 18,
                end: 39
            )
        )
        
        let returnedElement = applyMove(using: "`", on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "quotes")
        XCTAssertEqual(returnedElement?.caretLocation, 28)  
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
}


// emojis
extension ASNM_yiInnerQuotedString_Tests {
    
    func test_that_it_handles_emojis() {
        let text = """
need to deal with
those💨️💨️💨️ fac"🍵️s 🥺️☹️😂️ h😀️ha👅️" hhohohoo🤣️
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 73,
            caretLocation: 20,
            selectedLength: 1,
            selectedText: "o",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 18,
                end: 73
            )
        )
        
        let returnedElement = applyMove(using: "\"", on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "🍵️s 🥺️☹️😂️ h😀️ha👅️")
        XCTAssertEqual(returnedElement?.caretLocation, 37)  
        XCTAssertEqual(returnedElement?.selectedLength, 3)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
}
