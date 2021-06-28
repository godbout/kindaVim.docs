@testable import kindaVim
import XCTest


class ASNM_h_Tests: ASNM_BaseTests {
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asNormalMode.h(on: element) 
    }
    
}


// the 3 special cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
//extension ASNM_h_Tests {
//    
//    func test_that_if_the_TextElement_is_empty_it_does_nothing_and_does_not_crash() {
//        let text = ""
//        let element = AccessibilityTextElement(
//            role: .textField,
//            value: text,
//            caretLocation: 0,
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
//        XCTAssertEqual(returnedElement?.caretLocation, 0)
//        XCTAssertEqual(returnedElement?.selectedLength, 0)
//        XCTAssertNil(returnedElement?.selectedText)
//    }
//    
//    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_but_not_on_an_empty_line_it_goes_back_one_character() {
//        let text = """
//caret is
//gonna be at the end
//"""
//        let element = AccessibilityTextElement(
//            role: .textArea,
//            value: text,
//            caretLocation: 28,
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
//        XCTAssertEqual(returnedElement?.caretLocation, 27)
//        XCTAssertEqual(returnedElement?.selectedLength, 0)
//        XCTAssertNil(returnedElement?.selectedText)
//    }
//    
//    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_and_on_an_empty_line_it_does_nothing_and_does_not_crash() {
//        let text = """
//caret is on its
//own empty
//line
//
//"""
//        let element = AccessibilityTextElement(
//            role: .textArea,
//            value: text,
//            caretLocation: 31,
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
//        XCTAssertEqual(returnedElement?.caretLocation, 31)
//        XCTAssertEqual(returnedElement?.selectedLength, 0)
//        XCTAssertNil(returnedElement?.selectedText)
//    }
//    
//}


// Both
extension ASNM_h_Tests {
    
    func test_that_in_normal_setting_h_goes_one_character_to_the_left() {
        let text = "h goes one character to the left"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 16,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 32
            )
        )

        let returnedElement = applyMove(on: element)

        XCTAssertEqual(returnedElement?.caretLocation, 15)
    }
    
//    func test_that_for_an_empty_Text_AXUIElement_h_does_not_move() {
//        let text = ""
//        let element = AccessibilityTextElement(
//            role: .textField,
//            value: text,
//            caretLocation: 0,
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
//        XCTAssertEqual(returnedElement?.caretLocation, 0)
//    }
    
    func test_that_at_the_beginning_of_a_Text_AXUIElement_h_does_not_move() {
        let text = """
if at beginning of a Text AXUIElement
h should not move
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 0,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 38
            )
        )

        let returnedElement = applyMove(on: element)

        XCTAssertEqual(returnedElement?.caretLocation, 0)
    }
    
//    func test_that_at_the_end_a_Text_AXUIElement_h_does_move() {
//        let text = """
//if at the end of a AXUIElement
//h should move if not
//if not on a last empty line
//"""
//        let element = AccessibilityTextElement(
//            role: .textArea,
//            value: text,
//            caretLocation: 79,
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
//        XCTAssertEqual(returnedElement?.caretLocation, text.count - 1)
//    }
    
}


// TextAreas
extension ASNM_h_Tests {

    func test_that_at_the_beginning_of_a_line_h_does_not_move_up_to_the_prevous_line_in_TextAreas() {
        let text = """
in multiline if
at the beginning of a line
h should not go up to
the previous line
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 43,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 43,
                end: 65
            )
        )

        let returnedElement = applyMove(on: element)

        XCTAssertEqual(returnedElement?.caretLocation, 43)
    }
    
//    func test_that_if_caret_is_on_last_empty_line_h_does_not_up_one_line() {
//        let text = """
//multi with
//stupid last empty
//line
//
//"""
//        let element = AccessibilityTextElement(
//            role: .textArea,
//            value: text,
//            caretLocation: 34,
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
//        XCTAssertEqual(returnedElement?.caretLocation, 34)
//    }

}
