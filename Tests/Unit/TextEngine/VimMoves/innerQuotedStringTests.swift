@testable import kindaVim
import XCTest


class innerQuotedStringTests: TextEngineBaseTests {}


// Both
extension innerQuotedStringTests {
    
    func test_that_if_there_is_no_quote_then_it_returns_nil() {
        let text = "yep no quote in here"
        
        XCTAssertNil(
            textEngine.innerQuotedString(using: "\"", startingAt: 2, in: text)
        )
    }
    
    func test_that_if_there_is_only_one_quote_then_it_returns_nil_also() {
        let text = "only one quote in 'there"
        
        XCTAssertNil(
            textEngine.innerQuotedString(using: "'", startingAt: 7, in: text)
        )
    }
    
    func test_that_if_there_are_two_quotes_and_the_caret_is_before_them_then_it_can_find_the_text() {
        let text = "finally some serious 'gourmet' shit"
        
        guard let quotedStringRange = textEngine.innerQuotedString(using: "'", startingAt: 4, in: text) else { return XCTFail() }
        
        XCTAssertEqual(quotedStringRange.lowerBound, 22)
        XCTAssertEqual(quotedStringRange.upperBound, 29) 
    }
    
    func test_that_if_there_are_two_quotes_and_the_caret_is_between_them_then_it_can_find_the_text() {
        let text = "wow now we're gonna eat shit a bit' lol"
        
        guard let quotedStringRange = textEngine.innerQuotedString(using: "'", startingAt: 15, in: text) else { return XCTFail() }
        
        XCTAssertEqual(quotedStringRange.lowerBound, 11)
        XCTAssertEqual(quotedStringRange.upperBound, 34) 
    }
    
    func test_that_if_there_are_two_quotes_and_the_caret_is_after_them_then_it_returns_nil() {
        let text = "pretty `tough` if you ask me"
        
        XCTAssertNil(
            textEngine.innerQuotedString(using: "`", startingAt: 18, in: text)
        )
    }
    
    func test_that_if_there_are_three_quotes_it_finds_the_correct_text() {
        let text = "that's \" three quotes \" in there \""
        
        guard let quotedStringRange = textEngine.innerQuotedString(using: "\"", startingAt: 29, in: text) else { return XCTFail() }
        
        XCTAssertEqual(quotedStringRange.lowerBound, 23)
        XCTAssertEqual(quotedStringRange.upperBound, 33) 
    }
    
    func test_that_if_the_caret_is_on_a_quote_then_it_calculates_the_matching_pairs_and_finds_the_correct_text() {
        let text = """
several "pairs" here and kindaVim should "know" which one to delete
"""
        
        guard let quotedStringRange = textEngine.innerQuotedString(using: "\"", startingAt: 41, in: text) else { return XCTFail() }
        
        XCTAssertEqual(quotedStringRange.lowerBound, 42)
        XCTAssertEqual(quotedStringRange.upperBound, 46) 
    }
    
    func test_some_more_that_if_the_caret_is_on_a_quote_then_it_calculates_the_matching_pairs_and_finds_the_correct_text() {
        let text = """
several "pairs" here and kindaVim should "know which one to delete
"""
        XCTAssertNil(
            textEngine.innerQuotedString(using: "\"", startingAt: 41, in: text)
        )
    }
    
    func test_that_if_the_string_is_empty_it_returns_nil() {
        let text = ""
        
        XCTAssertNil(
            textEngine.innerQuotedString(using: "\"", startingAt: 0, in: text)
        )
    }
    
}


// emojis
// see beginningOfWordBackward for the blah blah
extension innerQuotedStringTests {
    
    func test_that_it_handles_emojis() {
        let text = """
emojis are sy🧑‍🌾️🧑‍🌾️mbols" that 🔫️🔫️🔫️ are longer" than 1 length
"""
        guard let quotedStringRange = textEngine.innerQuotedString(using: "\"", startingAt: 9, in: text) else { return XCTFail() }
        
        XCTAssertEqual(quotedStringRange.lowerBound, 31)
        XCTAssertEqual(quotedStringRange.upperBound, 57) 
    }
    
}

