@testable import kindaVim
import XCTest


class beginningOfWordForwardTests: TextEngineBaseTests {}


// The 3 Cases:
// - empty TextElement
// - 2nd case is now gone!
// - caret at the end of TextElement on own empty line
extension beginningOfWordForwardTests {
    
    func test_that_if_the_text_is_empty_then_it_returns_0() {
        let text = ""
        
        let newCaretPosition = textEngine.beginningOfWordForward(startingAt: 0, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 0)
    }
    
    func test_that_if_the_caret_is_after_the_last_character_on_an_empty_line_then_it_does_not_move() {
        let text = """
a couple of
lines but not
coke haha but
with linefeed

"""
        
        let newCaretPosition = textEngine.beginningOfWordForward(startingAt: 54, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 54)
    }
    
}
    

// Both
extension beginningOfWordForwardTests {
    
    func test_that_it_can_go_to_the_beginning_of_the_next_word() {
        let text = "a few words to live by"
        
        let newCaretPosition = textEngine.beginningOfWordForward(startingAt: 6, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 12)
    }
    
    func test_that_it_stops_at_punctuations() {
        let text = "class wordForwardTests: XCTestCase {"
        
        let newCaretPosition = textEngine.beginningOfWordForward(startingAt: 8, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 22)
    }
    
    func test_that_it_does_not_get_blocked_at_a_punctuation() {
        let text = "textEngine.wordForward"
        
        let newCaretPosition = textEngine.beginningOfWordForward(startingAt: 10, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 11)
    }
    
    func test_that_it_does_not_stop_at_an_underscore() {
        let text = "func test_that_it_does_not_stop_at_an_underscore() {"
        
        let newCaretPosition = textEngine.beginningOfWordForward(startingAt: 5, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 48)
    }
    
    func test_that_it_passes_several_consecutive_whitespaces() {
        let text = "this is some text with        space"
        
        let newCaretPosition = textEngine.beginningOfWordForward(startingAt: 20, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 30)
    }

    func test_that_if_it_reaches_the_end_of_the_buffer_it_stops_before_the_last_character() {
        let text = "w at the end of the buffer shouldn't craaaash"

        let newCaretPosition = textEngine.beginningOfWordForward(startingAt: 42, in: TextEngineText(from: text))

        XCTAssertEqual(newCaretPosition, 44)
    }
    
    func test_that_it_passes_several_consecutive_punctuations() {
        let text = "for index in text[anchorIndex..<endIndex].indices {"
        
        let newCaretPosition = textEngine.beginningOfWordForward(startingAt: 29, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 32)
    }
    
    func test_that_it_does_not_stop_at_a_space_after_a_punctuation() {
        let text = "let anchorIndex = text.index(text.startIndex, offsetBy: location)"
        
        let newCaretPosition = textEngine.beginningOfWordForward(startingAt: 54, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 56)
    }
    
    func test_that_it_does_not_stop_at_a_space_after_a_symbol() {
        let text = "guard index != text.index(before: endIndex) else { return text.count - 1 }"
        
        let newCaretPosition = textEngine.beginningOfWordForward(startingAt: 12, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 15)
    }
    
    func test_that_it_does_not_stop_at_a_space_after_a_number() {
        let text = "guard index != text.index(before: endIndex) else { return text.count - 1 }"
        
        let newCaretPosition = textEngine.beginningOfWordForward(startingAt: 71, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 73)
    }
    
    func test_that_it_stops_at_underscores_that_are_not_part_of_a_word() {
        let text = """
if text[nextIndex] == "_" {
"""
        
        let newCaretPosition = textEngine.beginningOfWordForward(startingAt: 22, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 23)
    }
    
    func test_that_it_stops_at_punctuations_that_are_preceded_by_an_underscore() {
        let text = """
if text[nextIndex] == "_" {
"""
        
        let newCaretPosition = textEngine.beginningOfWordForward(startingAt: 23, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 24)
    }
    
    func test_that_it_does_not_stop_at_numbers_that_are_part_of_a_word() {
        let text = "saf sadfhasdf4asdf dfd"
        
        let newCaretPosition = textEngine.beginningOfWordForward(startingAt: 5, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 19)
    }
    
    func test_that_letters_numbers_and_underscores_together_are_considered_a_word() {
        let text = "this is gonna be only one word__oh_my_55_a yes"
        
        let newCaretPosition = textEngine.beginningOfWordForward(startingAt: 26, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 43)
    }
    
    func test_that_it_does_not_stop_after_an_underscore_that_finishes_a_word() {
        let text = "but who writes stuff like_ this"
        
        let newCaretPosition = textEngine.beginningOfWordForward(startingAt: 23, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 27)
    }

}

// TextViews
extension beginningOfWordForwardTests {

    func test_that_it_does_not_get_blocked_on_a_line() {
        let text = """
w can go
to the next line
"""

        let newCaretPosition = textEngine.beginningOfWordForward(startingAt: 7, in: TextEngineText(from: text))

        XCTAssertEqual(newCaretPosition, 9)
    }
    
    func test_that_it_stops_at_an_empty_line() {
        let text = """
w should stop

at empty lines
"""
        
        let newCaretPosition = textEngine.beginningOfWordForward(startingAt: 12, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 14)
    }

    func test_that_it_does_not_stop_at_a_line_that_has_just_whitespaces() {
        let text = """
w shouldn't stop
at the following line that looks empty but has
   
whitespaces
"""

        let newCaretPosition = textEngine.beginningOfWordForward(startingAt: 63, in: TextEngineText(from: text))

        XCTAssertEqual(newCaretPosition, 68)
    }

}


// emojis
// emojis are symbols so as long as we take care of the emojis length, all the rest
// works exactly like symbols: passing, skipping, part or not of words, etc...
// so no need to test those parts again.
extension beginningOfWordForwardTests {

    func test_that_it_handles_emojis() {
        let text = "emojis are symbols that 🔫️🔫️🔫️ are longer than 1 length"
        
        let newCaretPosition = textEngine.beginningOfWordForward(startingAt: 27, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 34)
    }
    
}
