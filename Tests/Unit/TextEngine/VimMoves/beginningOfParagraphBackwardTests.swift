@testable import kindaVim
import XCTest


class beginningOfParagraphBackwardTests: TextEngineBaseTests {}


// the 3 special cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
extension beginningOfParagraphBackwardTests {
    
    func test_that_if_the_text_is_empty_then_it_returns_0() {
        let text = ""
        
        let newCaretPosition = textEngine.beginningOfParagraphBackward(startingAt: 0, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 0)
    }
    
    func test_that_if_the_caret_is_after_the_last_character_on_a_non_empty_line_then_it_still_goes_to_the_beginning_of_the_paragraph() {
        let text = """
a couple of

lines but not
coke haha
"""
        
        let newCaretPosition = textEngine.beginningOfParagraphBackward(startingAt: 36, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 12)
    }
    
    func test_that_if_the_caret_is_after_the_last_character_on_an_empty_line_then_it_still_goes_to_the_beginning_of_the_paragraph() {
        let text = """
a couple of


lines but not
coke haha but
with linefeed

"""
        
        let newCaretPosition = textEngine.beginningOfParagraphBackward(startingAt: 56, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 13)
    }
    
}


// Both
extension beginningOfParagraphBackwardTests {
    
    func test_that_it_returns_0_if_the_text_is_empty() {
        let text = ""
        
        let newCaretPosition = textEngine.beginningOfParagraphBackward(startingAt: 0, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 0)
    }
    
    func test_that_if_the_text_does_not_have_linefeed_then_it_stops_at_the_beginning_of_the_text() {
        let text = "like a TextField really"
        
        let newCaretPosition = textEngine.beginningOfParagraphBackward(startingAt: 12, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 0)
    }
    
}

// TextFields
extension beginningOfParagraphBackwardTests {
    
    func test_that_it_can_go_to_the_beginning_of_the_current_paragraph() {
        let text = """
some poetry
that is beautiful

and some more blah blah
"""
        
        let newCaretPosition = textEngine.beginningOfParagraphBackward(startingAt: 40, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 30)
    }
    
    func test_that_if_the_caret_is_already_on_an_empty_line_it_skips_all_the_consecutive_empty_lines() {
        let text = """
other hello

hello



some more
"""
        
        let newCaretPosition = textEngine.beginningOfParagraphBackward(startingAt: 21, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 12)
    }
    
    func test_that_if_it_does_not_find_an_empty_line_it_stops_at_the_beginning_of_the_text() {
        let text = """
this
text
does not have
an empty line!
"""
        
        let newCaretPosition = textEngine.beginningOfParagraphBackward(startingAt: 23, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 0)
    }
    
    func test_that_it_does_not_crash_if_the_location_is_on_the_first_line_which_is_a_linefeed() {
        let text = """

hehe first line
is a linefeed
"""
        
        let newCaretPosition = textEngine.beginningOfParagraphBackward(startingAt: 0, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 0)
    }
    
    func test_that_it_does_not_crash_if_the_location_is_at_the_end_of_the_text() {
        let text = """
yes this can happen when the

caret is after the last character
"""
        
        let newCaretPosition = textEngine.beginningOfParagraphBackward(startingAt: 63, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 29)
    }
    
}
