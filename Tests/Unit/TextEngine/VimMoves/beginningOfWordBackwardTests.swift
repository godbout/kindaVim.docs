@testable import kindaVim
import KeyCombination
import XCTest


class beginningOfWordBackwardTests: TextEngineBaseTests {}


// The 3 Cases:
// - empty TextElement
// - 2nd case is now gone!
// - caret at the end of TextElement on own empty line
extension beginningOfWordBackwardTests {
    
    func test_that_if_the_text_is_empty_then_it_returns_0() {
        let text = ""
        
        let newCaretPosition = textEngine.beginningOfWordBackward(startingAt: 0, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 0)
    }
    
    func test_that_if_the_caret_is_after_the_last_character_on_an_empty_line_then_it_still_goes_to_the_beginning_of_the_last_word() {
        let text = """
a couple of
lines but not
coke haha but
with linefeed

"""
        
        let newCaretPosition = textEngine.beginningOfWordBackward(startingAt: 54, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 45)
    }
    
}


// Both
extension beginningOfWordBackwardTests {
    
    func test_that_it_can_go_to_the_beginning_of_the_current_word() {
        let text = "a few words to live by"
        
        let newCaretPosition = textEngine.beginningOfWordBackward(startingAt: 18, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 15)
    }
    
    func test_that_it_can_go_to_the_beginning_of_the_previous_word() {
        let text = "a few words to live by"
        
        let newCaretPosition = textEngine.beginningOfWordBackward(startingAt: 15, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 12)
    }
    
    func test_that_it_stops_at_the_beginning_of_a_word_before_a_punctuation() {
        let text = "textEngine.wordBackward(startingAt: 18, in: TextEngineText(from: text))"
        
        let newCaretPosition = textEngine.beginningOfWordBackward(startingAt: 20, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 11)
    }
    
    func test_that_it_stops_at_the_beginning_of_a_punctuation() {
        let text = "textEngine....wordBackward(startingAt: 18, in: TextEngineText(from: text))"
        
        let newCaretPosition = textEngine.beginningOfWordBackward(startingAt: 11, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 10)
    }
    
    func test_that_it_passes_several_consecutive_punctuations() {
        let text = "textEngine....wordBackward(startingAt: 18, in: TextEngineText(from: text))"
        
        let newCaretPosition = textEngine.beginningOfWordBackward(startingAt: 14, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 10)
    }
    
    func test_that_it_does_not_stop_at_an_underscore() {
        let text = "func test_that_it_does_not_stop_at_an_underscore() {"
        
        let newCaretPosition = textEngine.beginningOfWordBackward(startingAt: 48, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 5)
    }
    
    func test_that_it_passes_several_consecutive_whitespaces() {
        let text = "this is some text with        space"
        
        let newCaretPosition = textEngine.beginningOfWordBackward(startingAt: 30, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 18)
    }
    
    func test_that_if_it_reaches_the_start_of_the_buffer_it_stops_at_the_first_character() {
        let text = "yoooooo my man"
        
        let newCaretPosition = textEngine.beginningOfWordBackward(startingAt: 5, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 0)
    }
    
    func test_that_it_stops_at_punctuations_that_are_before_an_underscore() {
        let text = """
if text[index] == "_" {
"""
        let newCaretPosition = textEngine.beginningOfWordBackward(startingAt: 22, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 20)
    }
    
    func test_that_it_stops_at_underscores_that_are_not_part_of_a_word() {
        let text = """
if text[index] == "_" {
"""
        let newCaretPosition = textEngine.beginningOfWordBackward(startingAt: 20, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 19)
    }
    
    func test_that_it_stops_at_symbols_that_are_after_a_whitespace() {
        let text = """
if text[index] == "_" {
"""
        let newCaretPosition = textEngine.beginningOfWordBackward(startingAt: 18, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 15)
    }
    
    func test_that_it_does_not_stop_at_numbers_when_part_of_a_word() {
        let text = "it is somewordwith5numbers in it"
        
        let newCaretPosition = textEngine.beginningOfWordBackward(startingAt: 16, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 6)
    }
    
    func test_that_it_does_stop_at_numbers_by_themselves() {
        let text = "numbers by themselves 8 are a word!"
        
        let newCaretPosition = textEngine.beginningOfWordBackward(startingAt: 24, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 22)
    }
    
    func test_that_it_skips_consecutive_numbers() {
        let text = "numbers by themselves 8888 are a word!"
        
        let newCaretPosition = textEngine.beginningOfWordBackward(startingAt: 27, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 22)                
    }
    
    func test_that_it_stops_at_symbols() {
        let text = "it is something+else yeah"
        
        let newCaretPosition = textEngine.beginningOfWordBackward(startingAt: 19, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 16)
    }
    
    func test_that_it_skips_consecutive_symbols() {
        let text = "it is something=€=+else yeah"
        
        let newCaretPosition = textEngine.beginningOfWordBackward(startingAt: 19, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 15)
    }
    
    func test_that_it_does_not_stop_at_a_symbol_if_it_is_preceded_by_a_punctuation_except_underscore() {
        let text = "ext[index] != 28"
        
        let newCaretPosition = textEngine.beginningOfWordBackward(startingAt: 14, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 11)
    }
    
    func test_that_letters_numbers_and_underscores_together_are_considered_a_word() {
        let text = "this is gonna be only one word__oh_my_55_a yes"
        
        let newCaretPosition = textEngine.beginningOfWordBackward(startingAt: 43, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 26)
    }
        
}
    

// TextViews
extension beginningOfWordBackwardTests {
    
    func test_that_it_does_not_get_blocked_on_a_line() {
        let text = """
to the previous line
b can go
"""
        
        let newCaretPosition = textEngine.beginningOfWordBackward(startingAt: 21, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 16)
    }
    
    func test_that_it_stops_at_an_empty_line() {
        let text = """
b should stop

at empty lines
"""
        
        let newCaretPosition = textEngine.beginningOfWordBackward(startingAt: 15, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 14)
    }
    
    func test_that_it_stops_at_an_empty_line_but_skip_the_whitespaces_on_the_current_line() {
        let text = """
b should stop at empty lines and 

    skip the whitespaces on this line
"""
        
        let newCaretPosition = textEngine.beginningOfWordBackward(startingAt: 39, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 34)
    }
    
    func test_that_it_does_not_stop_at_a_line_that_has_just_whitespaces() {
        let text = """
b shouldn't stop
at the previous line that looks empty but has
   
whitespaces
"""
        
        let newCaretPosition = textEngine.beginningOfWordBackward(startingAt: 67, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 59)
    }
    
}


// emojis
// emojis are symbols so as long as we take care of the emojis length, all the rest
// works exactly like symbols: passing, skipping, part or not of words, etc...
// so no need to test those parts again.
extension beginningOfWordBackwardTests {

    func test_that_it_handles_emojis() {
        let text = "emojis are symbols that 🔫️🔫️🔫️ are longer than 1 length"
        
        let newCaretPosition = textEngine.beginningOfWordBackward(startingAt: 30, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 24)                
    }
    
}
