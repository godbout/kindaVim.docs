@testable import kindaVim
import XCTest


class ASNM_o_Tests: ASNM_BaseTests {
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asNormalMode.o(on: element) 
    }
    
}


// TextFields
extension ASNM_o_Tests {
    
    func test_that_for_a_TextField_it_does_nothing() {
        let text = "o shouldn't do anything in a TextField!"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 15,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 39
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertNil(returnedElement?.selectedText)
    }
    
}


// TextViews
extension ASNM_o_Tests {
    
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
            caretLocation: 38,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
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
            caretLocation: 21,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 5,
                end: 28
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.selectedLength, 6)
        XCTAssertEqual(returnedElement?.selectedText, " space\n    ")            
    }
    
    func test_that_the_caret_goes_to_the_same_tabs_indentation_as_the_previous_line_on_the_newly_create_line() throws {
        throw XCTSkip("""
the implementation works but not the tests. probably has to do with \t and UTF8 or 16 stuff
like the emojis. i can't use a real tab in Xcode because it gets transformed in four spaces.
but when using a real tab in a TextElement, the move works properly. so skipping for now
until we solved the fucking emoji shit.
""")
        
        let text = """
like
\tthere's some space
so the new line follows that
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 18,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 5,
                end: 28
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.selectedLength, 6)
        XCTAssertEqual(returnedElement?.selectedText, " space\n\t")            
    }
    
    func test_that_if_on_the_last_line_it_does_not_cut_and_put_the_last_character_on_the_next_new_line() {
        let text = """
it should not cut the last character
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 25,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 36
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.selectedLength, 11)
        XCTAssertEqual(returnedElement?.selectedText, "t character\n")        
        
    }
    
//    func test_that_if_on_the_last_empty_line_it_does_create_a_new_line() {
//        let text = """
//caret on empty last line
//
//"""
//        let element = AccessibilityTextElement(
//            role: .textArea,
//            value: text,
//            caretLocation: 25,
//            currentLine: AccessibilityTextElementLine(
//                fullValue: text,
//                number: nil,
//                start: nil,
//                end: nil
//            )
//        )
//        
//        let returnedElement = applyMove(on: element)
//        
//        XCTAssertEqual(returnedElement?.selectedLength, 0)
//        XCTAssertEqual(returnedElement?.selectedText, "\n")   
//    }
    
    func test_that_if_on_a_line_that_is_just_a_linefeed_it_does_create_one_line_and_goes_to_that_line_not_two_lines_below() {
        let text = """
two lines empty below


"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 22,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 22,
                end: 23
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.selectedLength, 0)
        XCTAssertEqual(returnedElement?.selectedText, "\n")   
    }
    
}

