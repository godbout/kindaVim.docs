@testable import kindaVim
import XCTest

class findNextTests: TextEngineBaseTests {}

// Both
extension findNextTests {
    
    func test_that_in_normal_setting_it_returns_the_correct_location() {
        let text = "check if f can find shit!"
        let location = textEngine.findNext("i", after: 10, in: TextEngineLine(from: text))
        
        XCTAssertEqual(location, 16)        
    }
    
    func test_that_if_we_already_are_on_the_character_we_are_looking_then_we_get_the_location_of_the_next_occurrence() {
        let text = "check if f can find f!"
        let location = textEngine.findNext("f", after: 9, in: TextEngineLine(from: text))
        
        XCTAssertEqual(location, 15)     
    }
    
    func test_that_if_it_cannot_find_the_character_then_we_get_nil() {
        let text = """
can't find character
here so caret shouldn't move
"""
        let location = textEngine.findNext("z", after: 24, in: TextEngineText(from: text))
        
        XCTAssertEqual(location, nil)
    }
    
    func test_that_if_we_are_at_the_end_of_the_line_we_get_nil() {
        let text = "caret at the end of line"
        let location = textEngine.findNext("r", after: 24, in: TextEngineLine(from: text))
        
        XCTAssertEqual(location, nil)
        
    }
    
    func test_that_if_we_are_at_the_endLimit_of_the_line_we_get_nil_even_if_the_last_character_is_the_one_we_are_looking_for() {
        let text = "caret at the endLinit of line"
        let location = textEngine.findNext("e", after: 28, in: TextEngineLine(from: text))
        
        XCTAssertEqual(location, nil)        
    }
    
    func test_that_it_returns_nil_for_an_empty_line() {
        let text = ""
        
        let location = textEngine.findNext("a", after: 0, in: TextEngineLine(from: text))
        
        XCTAssertNil(location)
    }
    
}

// TextViews
extension findNextTests {
    
    func test_that_it_gets_the_right_location_even_for_multilines() {
        let text = """
pretty long
text if you
ask my opinion
"""
        let location = textEngine.findNext("k", after: 15, in: TextEngineText(from: text))
        
        XCTAssertEqual(location, 26)        
    }
    
}


// emojis
// see beginningOfWordBackward for the blah blah
extension findNextTests {
    
    func test_that_it_handles_emojis() {
        let text = "check if f can 😂️ find ☹️!"
        let location = textEngine.findNext("d", after: 2, in: TextEngineLine(from: text))
        
        XCTAssertEqual(location, 22)
    }
    
}
