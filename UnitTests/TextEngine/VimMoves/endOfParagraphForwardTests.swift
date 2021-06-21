@testable import kindaVim
import XCTest


class endOfParagraphForwardTests: TextEngineBaseTests {}



// Both
extension endOfParagraphForwardTests {
    
    func test_that_it_returns_0_if_the_text_is_empty() {
        let text = ""
        
        let newCaretPosition = textEngine.endOfParagraphForward(startingAt: 0, in: text)
        
        XCTAssertEqual(newCaretPosition, 0)
    }
    
    func test_that_if_the_text_does_not_have_linefeed_then_it_stops_before_the_last_character() {
        let text = "like a TextField really"
        
        let newCaretPosition = textEngine.endOfParagraphForward(startingAt: 2, in: text)
        
        XCTAssertEqual(newCaretPosition, 22)
    }
    
}

// TextFields
extension endOfParagraphForwardTests {
    
    func test_that_it_can_go_to_the_end_of_the_current_paragraph() {
        let text = """
some poetry
that is beautiful

and some more blah blah
"""
        
        let newCaretPosition = textEngine.endOfParagraphForward(startingAt: 6, in: text)
        
        XCTAssertEqual(newCaretPosition, 30)
    }
    
    func test_that_if_the_caret_is_already_on_an_empty_line_it_skips_all_the_consecutive_empty_lines() {
        let text = """
hello



some more
"""
        
        let newCaretPosition = textEngine.endOfParagraphForward(startingAt: 6, in: text)
        
        XCTAssertEqual(newCaretPosition, 17)
    }
    
    func test_that_if_it_does_not_find_an_empty_line_it_stops_before_the_last_character() {
        let text = """
this
text
does not have
an empty line!
"""
        
        let newCaretPosition = textEngine.endOfParagraphForward(startingAt: 3, in: text)
        
        XCTAssertEqual(newCaretPosition, 37)
    }
    
}
