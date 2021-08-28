@testable import kindaVim
import KeyCombination
import XCTest


// here we don't need much tests for what is a Vim word
// as this is already tested in other Text Engine funcs.
// innerWord is using beginningOfWordBackward and endOfWordForward
// for its calculation (which are already tested), except for whitespaces
// which is why it's more important to have the whitespaces tested here
class innerWordTests: TextEngineBaseTests {}


// Both
extension innerWordTests {
    
    func test_that_it_the_caret_is_on_a_letter_if_finds_the_correct_inner_word() {
        let text = "ok we're gonna try to get the inner word here"
        
        let wordRange = textEngine.innerWord(startingAt: 10, in: text)
        
        XCTAssertEqual(wordRange.lowerBound, 9)
        XCTAssertEqual(wordRange.upperBound, 14) 
    }
    
    func test_that_if_the_caret_is_on_a_space_the_inner_word_is_all_the_consecutive_spaces() {
        let text = "ok so now we have a lot of     spaces"
        
        let wordRange = textEngine.innerWord(startingAt: 28, in: text)
        
        XCTAssertEqual(wordRange.lowerBound, 26)
        XCTAssertEqual(wordRange.upperBound, 31)         
    }
    
    func test_that_if_the_caret_is_on_a_single_space_it_recognizes_it_as_an_inner_word() {
        let text = "a single space is an inner word"
        
        let wordRange = textEngine.innerWord(startingAt: 20, in: text)
        
        XCTAssertEqual(wordRange.lowerBound, 20)
        XCTAssertEqual(wordRange.upperBound, 21) 
    }
    
    func test_that_if_the_TextField_starts_with_spaces_it_finds_the_correct_inner_word() {
        let text = "     that's lots of spaces"
        
        let wordRange = textEngine.innerWord(startingAt: 4, in: text)
        
        XCTAssertEqual(wordRange.lowerBound, 0)
        XCTAssertEqual(wordRange.upperBound, 5) 
    }
    
    func test_that_if_the_TextField_ends_with_spaces_it_still_gets_the_correct_inner_word() {
        let text = "that's lots of spaces again       "
        
        let wordRange = textEngine.innerWord(startingAt: 29, in: text)
        
        XCTAssertEqual(wordRange.lowerBound, 27)
        XCTAssertEqual(wordRange.upperBound, 34) 
    }
    
    func test_that_if_the_text_is_empty_it_returns_a_range_of_0_to_0() {
        let text = ""
        
        let wordRange = textEngine.innerWord(startingAt: 0, in: text)
        
        XCTAssertEqual(wordRange.lowerBound, 0)
        XCTAssertEqual(wordRange.upperBound, 0) 
    }
    
}


// TextViews
extension innerWordTests {
    
    func test_that_inner_word_stops_at_linefeeds_at_the_end_of_lines() {
        let text = """
this shouldn't
spill      
   on the next line
"""
        
        let wordRange = textEngine.innerWord(startingAt: 23, in: text)
        
        XCTAssertEqual(wordRange.lowerBound, 20)
        XCTAssertEqual(wordRange.upperBound, 26)
    }
    
    func test_that_inner_word_stops_at_linefeeds_at_the_beginning_of_lines() {
        let text = """
this shouldn't
spill also    
    backwards
"""
        
        let wordrange = textEngine.innerWord(startingAt: 33, in: text)
        
        XCTAssertEqual(wordrange.lowerBound, 30)
        XCTAssertEqual(wordrange.upperBound, 34)
    }
    
}


// emojis
// emojis are symbols so as long as we take care of the emojis length, all the rest
// works exactly like symbols: passing, skipping, part or not of words, etc...
// so no need to test those parts again.
extension innerWordTests {
    
    func test_that_it_handles_emojis() {
        let text = "emojis are symbols that 🔫️🔫️🔫️ are longer than 1 length"
        
        let wordRange = textEngine.innerWord(startingAt: 27, in: text)
        
        XCTAssertEqual(wordRange.lowerBound, 24)
        XCTAssertEqual(wordRange.upperBound, 33)                
    }
    
    func test_that_it_does_not_do_shit_with_emojis_before_a_space() {
        let text = "emojis are symbols that 🔫️🔫️🔫️ are longer than 1 length"
        
        let wordRange = textEngine.innerWord(startingAt: 33, in: text)
        
        XCTAssertEqual(wordRange.lowerBound, 33)
        XCTAssertEqual(wordRange.upperBound, 34)                
    }
    
}
