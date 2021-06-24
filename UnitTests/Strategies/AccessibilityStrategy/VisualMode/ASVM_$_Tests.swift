@testable import kindaVim
import XCTest


class ASVM_$_Tests: ASVM_BaseTests {
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asVisualMode.dollarSign(on: element) 
    }
    
}


// the 3 special cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
extension ASVM_$_Tests {
    
    func test_that_if_the_TextElement_is_empty_it_does_nothing_and_does_not_crash() {
        let text = ""
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 0,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: nil,
                start: nil,
                end: nil
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 0)
        XCTAssertEqual(returnedElement?.selectedLength, 0)
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_but_not_on_an_empty_line_it_goes_back_one_character_and_selects_it() {
        let text = """
caret is
gonna be at the end
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 28,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: nil,
                start: nil,
                end: nil
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 28)
        XCTAssertEqual(returnedElement?.selectedLength, 0)
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_and_on_an_empty_line_it_does_nothing_and_does_not_crash() {
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
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 31)
        XCTAssertEqual(returnedElement?.selectedLength, 0)
    }
    
}


// Both
extension ASVM_$_Tests {
    
    func test_that_if_the_line_ends_with_a_visible_character_it_goes_to_that_last_character() {
        let text = "hello world"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 3,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 11
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 3)
        XCTAssertEqual(returnedElement?.selectedLength, 8)
    }
    
}


// TextViews
extension ASVM_$_Tests {
    
    func test_that_if_line_ends_with_linefeed_it_goes_to_the_end_of_the_line_still() {
        let text = """
indeed
that is
multiline
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 13,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 7,
                end: 15
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 13)
        XCTAssertEqual(returnedElement?.selectedLength, 2)
    }
    
    func test_that_if_the_caret_is_at_the_last_position_of_the_TextView_it_goes_back_one_character_and_selects_it() {
        let text = """
some more text
my friend
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 24,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: nil,
                start: nil,
                end: nil
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 23)
        XCTAssertEqual(returnedElement?.selectedLength, 1)
    }
    
}
