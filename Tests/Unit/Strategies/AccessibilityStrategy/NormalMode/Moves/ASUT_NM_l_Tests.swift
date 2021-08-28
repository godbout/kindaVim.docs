@testable import kindaVim
import KeyCombination
import XCTest


class ASUT_NM_l_Tests: ASNM_BaseTests {
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asNormalMode.l(on: element) 
    }
    
}


// Both
extension ASUT_NM_l_Tests {
    
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
extension ASUT_NM_l_Tests {
    
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


// emojis
extension ASUT_NM_l_Tests {
    
    func test_that_it_stops_at_emojis_properly_like_an_adult() {
        let text = """
gonna blow up
that shit 💣️ again
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 33,
            caretLocation: 23,
            selectedLength: 1,
            selectedText: " ",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 14,
                end: 33
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 24)
        XCTAssertEqual(returnedElement?.selectedLength, 3)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
    func test_that_it_can_pass_and_does_not_get_stuck_at_emojis() {
        let text = """
gonna blow up
that shit 💣️ again
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 33,
            caretLocation: 24,
            selectedLength: 3,
            selectedText: "💣️",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 14,
                end: 33
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 27)
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
}
