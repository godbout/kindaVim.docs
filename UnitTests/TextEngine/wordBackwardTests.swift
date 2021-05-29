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
    
}
