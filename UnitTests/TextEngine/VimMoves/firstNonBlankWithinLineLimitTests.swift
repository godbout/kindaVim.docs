@testable import kindaVim
import XCTest


class firstNonBlankWithinLineLimitTests: TextEngineBaseTests {}


// Both
extension firstNonBlankWithinLineLimitTests {
    
    func test_that_if_the_line_starts_with_spaces_it_returns_the_correct_location() {
        let text = "     some spaces are found at the beginning of this text"
        
        let location = textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: text))
        
        XCTAssertEqual(location, 5)     
    }
    
    func test_that_if_the_line_starts_with_a_tab_character_it_still_returns_the_correct_location() {
        let text = "\t\ttwo tabs now are found at the beginning of this text"
        
        let location = textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: text))
        
        XCTAssertEqual(location, 2)   
    }
    
    func test_that_if_the_line_starts_with_a_fucking_mix_of_tabs_and_spaces_it_still_returns_the_correct_location() {
        let text = "  \twho writes shits like this?"
        
        let location = textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: text))
        
        XCTAssertEqual(location, 3)   
    }
    
    func test_that_if_the_line_starts_with_non_blank_characters_then_the_caret_location_is_0() {
        let text = "non whitespace at the beginning here"
        
        let location = textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: text))
        
        XCTAssertEqual(location, 0)
    }
    
    func test_that_if_the_line_is_empty_the_caret_location_is_0() {
        let text = ""
        
        let location = textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: text))
        
        XCTAssertEqual(location, 0)
    }
    
    func test_that_if_the_line_only_contains_spaces_the_caret_goes_to_the_end_limit_of_the_line() {
        let text = "        "
        
        let location = textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: text))
        
        XCTAssertEqual(location, 7)
    }
    
    func test_that_if_the_line_only_contains_spaces_and_ends_with_a_linefeed_the_caret_goes_to_the_end_limit_of_the_line() {
        let text = "     \n"
        
        let location = textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: text))
        
        XCTAssertEqual(location, 4)
    }
    
}
