@testable import kindaVim
import KeyCombination
import XCTest


class ASUT_NM_$_Tests: ASNM_BaseTests {
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asNormalMode.dollarSign(on: element) 
    }
    
}



// Both
extension ASUT_NM_$_Tests {
    
    func test_that_if_line_ends_with_visible_character_$_goes_one_character_before_the_end() {
        let text = "hello world"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 11,
            caretLocation: 4,
            selectedLength: 0,
            selectedText: "",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 11
            )
        )

        let returnedElement = applyMove(on: element)

        XCTAssertEqual(returnedElement?.caretLocation, 10)
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }

}
    

// TextViews
extension ASUT_NM_$_Tests {
    
    func test_that_if_line_ends_with_linefeed_$_goes_two_characters_before_the_end() {
        let text = """
indeed
that is
multiline
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 24,
            caretLocation: 13,
            selectedLength: 1,
            selectedText: "s",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 7,
                end: 15
            )
        )

        let returnedElement = applyMove(on: element)

        XCTAssertEqual(returnedElement?.caretLocation, 13)
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
    func test_that_if_a_line_is_empty_$_does_not_go_up_to_the_end_of_the_previous_line() {
        let text = """
$ shouldn't
go up one else

it's a bug!
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 39,
            caretLocation: 27,
            selectedLength: 1,
            selectedText: "\n",
            currentLine: AccessibilityTextElementLine(
            fullValue: text,
            number: 3,
            start: 27,
            end: 28
            )
            )

        let returnedElement = applyMove(on: element)

        XCTAssertEqual(returnedElement?.caretLocation, 27)
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }

}


// emojis
extension ASUT_NM_$_Tests {
    
    func test_that_it_handles_emojis() {
        let text = """
need to deal with
those 🍃️🍃️🍃️🍃️🍃️🍃️ f🚀️ces 🥺️☹️😂️
more
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 64,
            caretLocation: 33,
            selectedLength: 3,
            selectedText: "🍃️",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 18,
                end: 60
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 56)
        XCTAssertEqual(returnedElement?.selectedLength, 3)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
}

