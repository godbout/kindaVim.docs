@testable import kindaVim
import KeyCombination
import XCTest


class endOfWORDForwardTests: TextEngineBaseTests {}


// The 3 Cases:
// - empty TextElement
// - 2nd case is now gone!
// - caret at the end of TextElement on own empty line
extension endOfWORDForwardTests {
    
    func test_that_if_the_text_is_empty_then_it_returns_0() {
        let text = ""
        
        let newCaretPosition = textEngine.endOfWORDForward(startingAt: 0, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 0)
    }
    
    func test_that_if_the_caret_is_after_the_last_character_on_an_empty_line_then_it_does_not_move() {
        let text = """
a couple of
lines but not
coke haha but
with linefeed

"""
        
        let newCaretPosition = textEngine.endOfWORDForward(startingAt: 54, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 54)
    }
    
}


// Both
extension endOfWORDForwardTests {
    
    func test_that_it_can_go_to_the_end_of_the_current_word() {
        let text = "some more words to live by..."
        
        let newCaretPosition = textEngine.endOfWORDForward(startingAt: 11, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 14)
    }
    
    func test_that_it_does_not_stop_at_spaces() {
        let text = "yep, it should just jump over spaces!"
        
        let newCaretPosition = textEngine.endOfWORDForward(startingAt: 13, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 18)
    }
    
    func test_that_it_considers_a_group_of_symbols_and_punctuations_including_underscore_as_a_word() {
        let text = "for index in text[anchorIndex..<endIndex].indices {"
        
        let newCaretPosition = textEngine.endOfWORDForward(startingAt: 28, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 48)
    }
    
    func test_that_it_does_not_stop_at_spaces_after_symbols() {
        let text = "func e(on element: AccessibilityTextelement?) -> AccessibilityTextElement? {"
        
        let newCaretPosition = textEngine.endOfWORDForward(startingAt: 44, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 47)
    }
    
    func test_that_it_should_skip_consecutive_whitespaces() {
        let text = "    continue"
        
        let newCaretPosition = textEngine.endOfWORDForward(startingAt: 1, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 11)
    }
    
    func test_that_it_should_skip_whitespaces_before_symbols() {
        let text = "offsetBy: location + 1,"
        
        let newCaretPosition = textEngine.endOfWORDForward(startingAt: 17, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 19)
    }
    
    func test_that_it_considers_consecutive_symbols_as_a_word() {
        let text = "if text[nextIndex].isWhitespace || text[nextIndex].isCharacterThatConstitutesAVimWord()"
        
        let newCaretPosition = textEngine.endOfWORDForward(startingAt: 30, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 33)
    }
    
}


// TextViews
extension endOfWORDForwardTests {
    
    func test_that_it_should_not_stop_on_linefeeds() {
        let text = """
guard index != text.index(before: endIndex) else { return text.count - 1 }
let nextIndex = text.index(after: index)
"""
        
        let newCaretPosition = textEngine.endOfWORDForward(startingAt: 73, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 77)
    }
    
    func test_that_it_skips_lines_that_are_just_made_of_whitespaces() {
        let text = """
let nextIndex = text.index(after: index)
               
if text[index].isCharacterThatConstitutesAVimWord() {
"""
        
        let newCaretPosition = textEngine.endOfWORDForward(startingAt: 39, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 58)
    }
    
}


// emojis
// see beginningOfWordBackward for the blah blah
extension endOfWORDForwardTests {
    
    func test_that_it_goes_to_the_end_of_a_WORD_made_of_emojis() {
        let text = "emojis are symbols theEat 🔫️🔫️pistol🔫️ are longer than 1 length"
        
        let newCaretPosition = textEngine.endOfWORDForward(startingAt: 24, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 38)                
    }
    
    func test_that_it_can_pass_the_end_of_a_WORD_made_of_emojis() {
        let text = "emojis are symbols theEat 🔫️🔫️pistol🔫️ are longer than 1 length"
        
        let newCaretPosition = textEngine.endOfWORDForward(startingAt: 38, in: TextEngineText(from: text))
        
        XCTAssertEqual(newCaretPosition, 44)                
    }
    
}

