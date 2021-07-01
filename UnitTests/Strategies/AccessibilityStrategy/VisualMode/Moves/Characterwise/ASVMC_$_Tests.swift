@testable import kindaVim
import XCTest


class ASVMC_$_Tests: ASVM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        VimEngine.shared.visualStyle = .characterwise
    }
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asVisualMode.dollarSign(on: element) 
    }
    
}


// the 3 special cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
extension ASVMC_$_Tests {
    
    func test_that_if_the_TextElement_is_empty_it_works_and_does_not_move() {
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
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 27)
        XCTAssertEqual(returnedElement?.selectedLength, 1)
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_and_on_an_empty_line_it_works_and_does_nothing() {
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
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 31)
        XCTAssertEqual(returnedElement?.selectedLength, 0)
    }
    
}


// Both
extension ASVMC_$_Tests {
    
    func test_that_if_the_line_ends_with_a_visible_character_it_goes_to_that_last_character() {
        let text = "hello world"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 11,
            caretLocation: 3,
            selectedLength: 1,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 11
            )
        )
        
        AccessibilityStrategyVisualMode.anchor = 3
        AccessibilityStrategyVisualMode.head = 3
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 3)
        XCTAssertEqual(returnedElement?.selectedLength, 8)
    }
    
    func test_that_it_starts_the_selection_at_the_anchor_and_not_at_the_current_caret_location() {
        let text = """
$ for visual mode starts
at the anchor, not at the caret location
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 65,
            caretLocation: 28,
            selectedLength: 1,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 25,
                end: 65
            )
        )
        
        AccessibilityStrategyVisualMode.anchor = 32
        AccessibilityStrategyVisualMode.head = 28
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 32)
        XCTAssertEqual(returnedElement?.selectedLength, 33)        
    }
    
}


// TextViews
extension ASVMC_$_Tests {
    
    func test_that_if_line_ends_with_linefeed_it_goes_to_the_end_of_the_line_still() {
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
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 7,
                end: 15
            )
        )
        
        AccessibilityStrategyVisualMode.anchor = 13
        AccessibilityStrategyVisualMode.head = 13
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 13)
        XCTAssertEqual(returnedElement?.selectedLength, 2)
    }
    
    //    func test_that_if_the_caret_is_at_the_last_position_of_the_TextView_it_goes_back_one_character_and_selects_it() {
    //        let text = """
    //some more text
    //my friend
    //"""
    //        let element = AccessibilityTextElement(
    //            role: .textArea,
    //            value: text,
    //            caretLocation: 24,
    //            currentLine: AccessibilityTextElementLine(
    //                fullValue: text,
    //                number: nil,
    //                start: nil,
    //                end: nil
    //            )
    //        )
    //        
    //        AccessibilityStrategyVisualMode.anchor = 24
    //        AccessibilityStrategyVisualMode.head = 24
    //        
    //        let returnedElement = applyMove(on: element)
    //        
    //        XCTAssertEqual(returnedElement?.caretLocation, 23)
    //        XCTAssertEqual(returnedElement?.selectedLength, 1)
    //    }
    
}
