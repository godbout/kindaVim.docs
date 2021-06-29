@testable import kindaVim
import XCTest


// this move is mostly using the TextEngine.innerQuotedString function.
// we're still doing the tests mostly to check that what is pasted in NSPasteboard is
// correct.
//
// the tests are useful as i found out that it was not correct :D
class ASNM_yiDoubleQuote_Tests: ASNM_BaseTests {

    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asNormalMode.yiDoubleQuote(on: element)
    }

}


// the 3 special cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
//
// for this move we check that in The 3 Cases the Pasteboard hasn't been touched
extension ASNM_yiDoubleQuote_Tests {

    func test_that_if_the_TextElement_is_empty_it_works_and_does_nothing() {
        let text = ""
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 0,
            caretLocation: 0,
            selectedLength: 0,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 0
            )
        )

        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 1 of The 3 Cases", forType: .string)

        _ = applyMove(on: element)

        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "test 1 of The 3 Cases")
    }

    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_but_not_on_an_empty_line_it_works_and_does_nothing() {
        let text = """
caret is
gonna be at the end
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 28,
            caretLocation: 28,
            selectedLength: 0,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 9,
                end: 28
            )
        )

        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 2 of The 3 Cases", forType: .string)

        _ = applyMove(on: element)

        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "test 2 of The 3 Cases")
    }

    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_and_on_an_empty_line_on_its_own_it_works_and_does_nothing() {
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

        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 3 of The 3 Cases", forType: .string)

        _ = applyMove(on: element)

        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "test 3 of The 3 Cases")
    }

}


// Both
extension ASNM_yiDoubleQuote_Tests {
    
    func test_that_there_is_no_double_quote_it_does_not_move_or_copy_anything() {
        let text = "some text without any double quote"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 34,
            caretLocation: 23,
            selectedLength: 1,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 34
            )
        )
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("no double quote", forType: .string)
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "no double quote")
        XCTAssertEqual(returnedElement?.caretLocation, 23)
    }
    
    func test_that_there_is_only_one_double_quote_it_does_not_move_or_copy_anything_either() {
        let text = """
now there's one " double quote
"""
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 30,
            caretLocation: 12,
            selectedLength: 1,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 30
            )
        )
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("only one double quote", forType: .string)
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "only one double quote")
        XCTAssertEqual(returnedElement?.caretLocation, 12)
    }
    
    func test_that_if_there_are_two_double_quotes_and_the_caret_is_before_them_then_it_moves_the_caret_and_copy_the_text() {
        let text = """
now there's
two "double quotes" on the second line
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 50,
            caretLocation: 14,
            selectedLength: 1,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 12,
                end: 50
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "double quotes")
        XCTAssertEqual(returnedElement?.caretLocation, 17)  
    }
    
    func test_that_if_there_are_two_double_quotes_and_the_caret_is_between_them_then_it_moves_the_caret_and_copy_the_text() {
        let text = """
again multiline
again
and now "hohohohoho"
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 42,
            caretLocation: 37,
            selectedLength: 1,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 3,
                start: 22,
                end: 42
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "hohohohoho")
        XCTAssertEqual(returnedElement?.caretLocation, 31)  
    }
    
    func test_that_if_there_are_two_double_quotes_and_the_caret_is_after_them_then_it_does_not_move_or_copy_anything() {
        let text = """
double "quotes" before the caret
"""
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 32,
            caretLocation: 26,
            selectedLength: 1,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 32
            )
        )
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("caret after double quote", forType: .string)
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "caret after double quote")
        XCTAssertEqual(returnedElement?.caretLocation, 26)  
    }
    
    func test_that_if_there_are_three_double_quotes_and_the_caret_is_not_after_all_of_them_then_it_moves_the_caret_and_copy_the_right_text() {
        let text = """
heheheheh
"quote" and some more" yeyeyeye
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 41,
            caretLocation: 30,
            selectedLength: 1,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 10,
                end: 41
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), " and some more")
        XCTAssertEqual(returnedElement?.caretLocation, 17)  
    }
    
    func test_matching_pairs_of_double_quotes() throws {
        throw XCTSkip("not for now i'm afraid...")
    }    
    
}
