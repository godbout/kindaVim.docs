@testable import kindaVim
import XCTest


class findNextNonBlankTests: TextEngineBaseTests {}


// Both
extension findNextNonBlankTests {
    
    func test_that_in_normal_setting_it_finds_the_next_non_blank_location() {
        let text = "those are        spaces!"
        
        let location = textEngine.findNextNonBlank(after: 11, in: text)
        
        XCTAssertEqual(location, 17)          
    }
    
    func test_that_if_the_caret_is_on_a_single_blank_then_it_returns_the_correct_location() {
        let text = "those are not many spaces!"
        
        let location = textEngine.findNextNonBlank(after: 13, in: text)
        
        XCTAssertEqual(location, 14)  
    }
    
    func test_that_if_there_is_no_non_blank_at_the_end_then_it_returns_nil() {
        let text = "spaces!             "
        
        let location = textEngine.findNextNonBlank(after: 11, in: text)
        
        XCTAssertNil(location) 
    }
        
    func test_that_it_does_not_crash_if_the_caret_is_at_the_beginning_of_the_text() {
        let text = "this is the text that may crash"
        
        let location = textEngine.findNextNonBlank(after: 0, in: text)
        
        XCTAssertEqual(location, 1) 
    }
    
    func test_that_it_does_not_crash_if_the_caret_is_at_the_end_of_the_text() {
        let text = "this is the text that may crash"
        
        let location = textEngine.findNextNonBlank(after: 31, in: text)
        
        XCTAssertNil(location) 
    }
    
}


// TextViews
extension findNextNonBlankTests {
    
    func test_that_it_does_stop_at_linefeeds() {
        let text = """
shouldn't go to the next       
     line
"""
        
        let location = textEngine.findNextNonBlank(after: 26, in: text)
        
        XCTAssertEqual(location, 31)
    }
    
}
