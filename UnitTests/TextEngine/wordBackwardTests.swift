@testable import kindaVim
import XCTest

class wordBackwardTests: TextEngineBaseTests {}

// Both
extension wordBackwardTests {
    
    func test_that_it_can_go_to_the_beginning_of_the_current_word() {
        let text = "a few words to live by"
        
        let newCaretPosition = textEngine.wordBackward(for: 18, playground: text)
        
        XCTAssertEqual(newCaretPosition, 15)
    }
    
    func test_that_it_can_go_to_the_beginning_of_the_previous_word() {
        let text = "a few words to live by"
        
        let newCaretPosition = textEngine.wordBackward(for: 15, playground: text)
        
        XCTAssertEqual(newCaretPosition, 12)
    }
    
    func test_that_it_stops_at_the_beginning_of_a_word_before_a_punctuation() {
        let text = "textEngine.wordBackward(for: 18, playground: text)"
        
        let newCaretPosition = textEngine.wordBackward(for: 20, playground: text)
        
        XCTAssertEqual(newCaretPosition, 11)
    }
    
    func test_that_it_stops_at_the_beginning_of_a_punctuation() {
        let text = "textEngine....wordBackward(for: 18, playground: text)"
        
        let newCaretPosition = textEngine.wordBackward(for: 11, playground: text)
        
        XCTAssertEqual(newCaretPosition, 10)
    }
    
    func test_that_it_passes_several_consecutive_punctuations() {
        let text = "textEngine....wordBackward(for: 18, playground: text)"
        
        let newCaretPosition = textEngine.wordBackward(for: 14, playground: text)
        
        XCTAssertEqual(newCaretPosition, 10)
    }
    
    func test_that_it_does_not_stop_at_an_underscore() {
        let text = "func test_that_it_does_not_stop_at_an_underscore() {"
        
        let newCaretPosition = textEngine.wordBackward(for: 48, playground: text)
        
        XCTAssertEqual(newCaretPosition, 5)
    }
    
    func test_that_it_passes_several_consecutive_whitespaces() {
        let text = "this is some text with        space"
        
        let newCaretPosition = textEngine.wordBackward(for: 30, playground: text)
        
        XCTAssertEqual(newCaretPosition, 18)
    }
    
    func test_that_if_it_reaches_the_start_of_the_buffer_it_stops_at_the_first_character() {
        let text = "yoooooo my man"
        
        let newCaretPosition = textEngine.wordBackward(for: 5, playground: text)
        
        XCTAssertEqual(newCaretPosition, 0)
    }
    
    func test_that_it_stops_at_punctuations_that_are_before_an_underscore() {
        let text = """
if text[index] == "_" {
"""
        let newCaretPosition = textEngine.wordBackward(for: 22, playground: text)
        
        XCTAssertEqual(newCaretPosition, 20)
    }
    
    func test_that_it_stops_at_underscores_that_are_not_part_of_a_word() {
        let text = """
if text[index] == "_" {
"""
        let newCaretPosition = textEngine.wordBackward(for: 20, playground: text)
        
        XCTAssertEqual(newCaretPosition, 19)
    }
    
    func test_that_it_stops_at_symbols_that_are_after_a_whitespace() {
        let text = """
if text[index] == "_" {
"""
        let newCaretPosition = textEngine.wordBackward(for: 18, playground: text)
        
        XCTAssertEqual(newCaretPosition, 15)
    }
    
    func test_that_it_does_not_stop_at_numbers_when_part_of_a_word() {
        let text = "it is somewordwith5numbers in it"
        
        let newCaretPosition = textEngine.wordBackward(for: 16, playground: text)
        
        XCTAssertEqual(newCaretPosition, 6)
    }
    
    func test_that_it_does_stop_at_numbers_by_themselves() {
        let text = "numbers by themselves 8 are a word!"
        
        let newCaretPosition = textEngine.wordBackward(for: 24, playground: text)
        
        XCTAssertEqual(newCaretPosition, 22)
    }
    
    func test_that_it_skips_consecutive_numbers() {
        let text = "numbers by themselves 8888 are a word!"
        
        let newCaretPosition = textEngine.wordBackward(for: 27, playground: text)
        
        XCTAssertEqual(newCaretPosition, 22)                
    }
    
    func test_that_it_stops_at_symbols() {
        let text = "it is something+else yeah"
        
        let newCaretPosition = textEngine.wordBackward(for: 19, playground: text)
        
        XCTAssertEqual(newCaretPosition, 16)
    }
    
    func test_that_it_skips_consecutive_symbols() {
        let text = "it is something=€=+else yeah"
        
        let newCaretPosition = textEngine.wordBackward(for: 19, playground: text)
        
        XCTAssertEqual(newCaretPosition, 15)
    }
    
    func test_that_it_does_not_stop_at_a_symbol_if_it_is_preceded_by_a_punctuation_except_underscore() {
        let text = "ext[index] != 28"
        
        let newCaretPosition = textEngine.wordBackward(for: 14, playground: text)
        
        XCTAssertEqual(newCaretPosition, 11)
    }
    
}
    

// TextViews
extension wordBackwardTests {
    
    func test_that_it_does_not_get_blocked_on_a_line() {
        let text = """
to the previous line
b can go
"""
        
        let newCaretPosition = textEngine.wordBackward(for: 21, playground: text)
        
        XCTAssertEqual(newCaretPosition, 16)
    }
    
    func test_that_it_stops_at_an_empty_line() {
        let text = """
b should stop

at empty lines
"""
        
        let newCaretPosition = textEngine.wordBackward(for: 15, playground: text)
        
        XCTAssertEqual(newCaretPosition, 14)
    }
    
    func test_that_it_stops_at_an_empty_line_but_skip_the_whitespaces_on_the_current_line() {
        let text = """
b should stop at empty lines and 

    skip the whitespaces on this line
"""
        
        let newCaretPosition = textEngine.wordBackward(for: 39, playground: text)
        
        XCTAssertEqual(newCaretPosition, 34)
    }
    
    func test_that_it_does_not_stop_at_a_line_that_has_just_whitespaces() {
        let text = """
b shouldn't stop
at the previous line that looks empty but has
   
whitespaces
"""
        
        let newCaretPosition = textEngine.wordBackward(for: 67, playground: text)
        
        XCTAssertEqual(newCaretPosition, 59)
    }
    
    func test_that_letters_numbers_and_underscores_together_are_considered_a_word() {
        let text = "this is gonna be only one word__oh_my_55_a yes"
        
        let newCaretPosition = textEngine.wordForward(for: 26, playground: text)
        
        XCTAssertEqual(newCaretPosition, 43)
    }
    
    func test_that_it_does_not_stop_after_an_underscore_that_finishes_a_word() {
        let text = "but who writes stuff like_ this"
        
        let newCaretPosition = textEngine.wordForward(for: 23, playground: text)
        
        XCTAssertEqual(newCaretPosition, 27)
    }
    
}
