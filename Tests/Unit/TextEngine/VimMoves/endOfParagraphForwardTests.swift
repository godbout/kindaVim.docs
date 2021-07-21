@testable import kindaVim
import XCTest


class endOfParagraphForwardTests: TextEngineBaseTests {}


// The 3 Cases:
// - empty TextElement
// - 2nd case is now gone!
// - caret at the end of TextElement on own empty line
extension endOfParagraphForwardTests {
    
    func test_that_if_the_text_is_empty_then_it_returns_0() {
        let text = ""
        
        let newCaretPosition = textEngine.endOfParagraphForward(startingAt: 0, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 0)
    }
    
    func test_that_if_the_caret_is_after_the_last_character_on_an_empty_line_then_it_does_not_move() {
        let text = """
a couple of
lines but not
coke haha but
with linefeed

"""
        
        let newCaretPosition = textEngine.endOfParagraphForward(startingAt: 54, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 54)
    }
    
}


// Both
extension endOfParagraphForwardTests {
    
    func test_that_it_returns_0_if_the_text_is_empty() {
        let text = ""
        
        let newCaretPosition = textEngine.endOfParagraphForward(startingAt: 0, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 0)
    }
    
    func test_that_if_the_text_does_not_have_linefeed_then_it_stops_before_the_last_character() {
        let text = "like a TextField really"
        
        let newCaretPosition = textEngine.endOfParagraphForward(startingAt: 2, in: TextEngineText(from: text))
        
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
        
        let newCaretPosition = textEngine.endOfParagraphForward(startingAt: 6, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 30)
    }
    
    func test_that_if_the_caret_is_already_on_an_empty_line_it_skips_all_the_consecutive_empty_lines() {
        let text = """
hello



some more
"""
        
        let newCaretPosition = textEngine.endOfParagraphForward(startingAt: 6, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 17)
    }
    
}


// emojis
// see beginningOfWordBackward for the blah blah
extension endOfParagraphForwardTests {
    
    func test_that_it_handles_emojis() {
        let text = """
yes 🐰️🐰️🐰️🐰️ this can happen🐰️🐰️ when the



🐰️🐰️car🐰️et is after the last character🐰️🐰️🐰️
"""
        
        let newCaretPosition = textEngine.endOfParagraphForward(startingAt: 13, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 48)
    }
    
}
