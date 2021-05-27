@testable import kindaVim
import XCTest

class AS_h_Tests: AS_BaseTests {}

// Both
extension AS_h_Tests {
    
    func test_that_in_normal_setting_h_goes_one_character_to_the_left() {
//        let text = "h goes one character to the left"
//        let element = AccessibilityTextElement(
//            axValue: text,
//            axCaretLocation: 16,
//            axLineStart: 0,
//            axLineEnd: text.count
//        )
//
//        let returnedElement = accessibilityStrategy.h(on: element)
//
//        XCTAssertEqual(returnedElement?.axCaretLocation, 15)
    }
    
    func test_that_for_an_empty_Text_AXUIElement_h_does_not_move() {
//        let element = AccessibilityTextElement(
//            axValue: "",
//            axCaretLocation: 0,
//            axLineStart: nil,
//            axLineEnd: nil
//        )
//
//        let returnedElement = accessibilityStrategy.h(on: element)
//
//        XCTAssertEqual(returnedElement?.axCaretLocation, 0)
    }
    
    func test_that_at_the_beginning_of_a_Text_AXUIElement_h_does_not_move() {
//        let text = """
//if at beginning of a Text AXUIElement
//h should not move
//"""
//        let element = AccessibilityTextElement(
//            axValue: text,
//            axCaretLocation: 0,
//            axLineStart: 0,
//            axLineEnd: 37
//        )
//
//        let returnedElement = accessibilityStrategy.h(on: element)
//
//        XCTAssertEqual(returnedElement?.axCaretLocation, 0)
    }
    
    func test_that_at_the_end_a_Text_AXUIElement_h_does_move() {
//        let text = """
//if at the end of a AXUIElement
//h should move if not
//if not on a last empty line
//"""
//        let element = AccessibilityTextElement(
//            axValue: text,
//            axCaretLocation: text.count,
//            axLineStart: nil,
//            axLineEnd: nil
//        )
//
//        let returnedElement = accessibilityStrategy.h(on: element)
//
//        XCTAssertEqual(returnedElement?.axCaretLocation, text.count - 1)
    }
    
}

// TextAreas
extension AS_h_Tests {

    func test_that_at_the_beginning_of_a_line_h_does_not_move_up_to_the_prevous_line_in_TextAreas() {
//        let text = """
//in multiline if
//at the beginning of a line
//h should not go up to
//the previous line
//"""
//        let element = AccessibilityTextElement(
//            axValue: text,
//            axCaretLocation: 43,
//            axLineStart: 43,
//            axLineEnd: 69
//        )
//
//        let returnedElement = accessibilityStrategy.h(on: element)
//
//        XCTAssertEqual(returnedElement?.axCaretLocation, 43)
    }
    
    func test_that_if_caret_is_on_last_empty_line_h_does_not_up_one_line() {
//        let text = """
//multi with
//stupid last empty
//line
//
//"""
//        let element = AccessibilityTextElement(
//            axValue: text,
//            axCaretLocation: 34,
//            axLineStart: nil,
//            axLineEnd: nil
//        )
//
//        let returnedElement = accessibilityStrategy.h(on: element)
//
//        XCTAssertEqual(returnedElement?.axCaretLocation, 34)
    }

}
