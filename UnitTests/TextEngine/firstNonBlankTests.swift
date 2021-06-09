@testable import kindaVim
import XCTest


class firstNonBlankTests: TextEngineBaseTests {}


// Both
extension firstNonBlankTests {
    
    func test_that_if_the_line_starts_with_spaces_it_returns_the_correct_location() {
        let text = "     some spaces are found at the beginning of this text"
        
        let location = textEngine.firstNonBlank(in: text)
        
        XCTAssertEqual(location, 5)     
    }
    
    func test_that_if_the_line_starts_with_a_tab_character_it_still_returns_the_correct_location() {
        let text = "\t\ttwo tabs now are found at the beginning of this text"
        
        let location = textEngine.firstNonBlank(in: text)
        
        XCTAssertEqual(location, 2)   
    }
    
    func test_that_if_the_line_starts_with_a_fucking_mix_of_tabs_and_spaces_it_still_returns_the_correct_location() {
        let text = "  \twho writes shits like this?"
        
        let location = textEngine.firstNonBlank(in: text)
        
        XCTAssertEqual(location, 3)   
    }
    
    func test_that_if_the_line_starts_with_non_blank_characters_then_the_caret_location_is_0() {
        let text = "non whitespace at the beginning here"
        
        let location = textEngine.firstNonBlank(in: text)
        
        XCTAssertEqual(location, 0)
    }
    
    func test_that_if_the_line_is_empty_the_caret_location_is_0() {
        let text = ""
        
        let location = textEngine.firstNonBlank(in: text)
        
        XCTAssertEqual(location, 0)
    }
    
    func test_that_if_the_TextField_only_contains_spaces_the_caret_goes_to_the_end_of_the_text() {
        let text = "        "
        
        let location = textEngine.firstNonBlank(in: text)
        
        XCTAssertEqual(location, 8)
    }
    
}


// TextViews
extension firstNonBlankTests {
    
    func test_that_for_a_line_with_linefeed_the_caret_goes_to_the_end_of_the_line_before_the_linefeed() {
        let text = """
            
and a line is empty!
"""
        
        let location = textEngine.firstNonBlank(in: text)
        
        XCTAssertEqual(location, 12)
    }
    
}
