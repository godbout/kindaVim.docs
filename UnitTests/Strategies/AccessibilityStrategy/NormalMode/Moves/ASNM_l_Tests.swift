@testable import kindaVim
import XCTest


class ASNM_l_Tests: ASNM_BaseTests {
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asNormalMode.l(on: element) 
    }
    
}


// The 3 Cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
extension ASNM_l_Tests {
    
    func test_that_if_the_TextElement_is_empty_it_does_not_move() {
        let text = ""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 0,
            caretLocation: 0,
            selectedLength: 0,
            selectedText: "",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 0
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 0)
        XCTAssertEqual(returnedElement?.selectedLength, 0)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_but_not_on_an_empty_line_it_works_and_moves_one_character_to_the_left() {
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
            selectedText: "",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 9,
                end: 28
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 27)
        XCTAssertEqual(returnedElement?.selectedLength, 0)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_and_on_an_empty_line_on_its_own_it_does_not_move() {
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
            selectedText: "",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 4,
                start: 31,
                end: 31
            )
        )        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 31)
        XCTAssertEqual(returnedElement?.selectedLength, 0)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
}


// Both
extension ASNM_l_Tests {
    
    func test_that_in_normal_setting_l_goes_one_character_to_the_right_in_Text_AXUIElement() {
        let text = "l should go one character to the right"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 38,
            caretLocation: 16,
            selectedLength: 1,
            selectedText: "c",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 38
            )
        )

        let returnedElement = applyMove(on: element)

        XCTAssertEqual(returnedElement?.caretLocation, 17)
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }
        
    func test_that_l_does_not_move_if_caret_is_at_end_limit_of_Text_AXUIElement() {
        let text = """
some multiline
shit again
hehe
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 30,
            caretLocation: 29,
            selectedLength: 1,
            selectedText: "e",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 3,
                start: 26,
                end: 30
            )
        )

        let returnedElement = applyMove(on: element)

        XCTAssertEqual(returnedElement?.caretLocation, 29)
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
}


// TextViews
extension ASNM_l_Tests {
    
    func test_that_if_the_caret_location_is_after_a_line_end_limit_then_it_goes_back_to_the_end_limit() {
        let text = """
hehe some lines
yeah my friend
it's two thirty
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 46,
            caretLocation: 30,
            selectedLength: 1,
            selectedText: "\n",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 16,
                end: 31
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 29)
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
}
