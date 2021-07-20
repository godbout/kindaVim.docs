@testable import kindaVim
import XCTest


class findPreviousNonBlankTests: TextEngineBaseTests {}


// Both
extension findPreviousNonBlankTests {
    
    func test_that_in_normal_setting_it_finds_the_previous_non_blank_location() {
        let text = "those are        spaces!"
        
        let location = textEngine.findPreviousNonBlank(startingAt: 15, in: text)
        
        XCTAssertEqual(location, 8)          
    }
    
    func test_that_if_the_caret_is_on_a_single_blank_then_it_returns_the_correct_location() {
        let text = "those are not many spaces!"
        
        let location = textEngine.findPreviousNonBlank(startingAt: 13, in: text)
        
        XCTAssertEqual(location, 12)  
    }
    
    func test_that_if_there_is_no_non_blank_at_the_start_then_it_returns_nil() {
        let text = "           many spaces!"
        
        let location = textEngine.findPreviousNonBlank(startingAt: 11, in: text)
        
        XCTAssertNil(location) 
    }
    
    func test_that_it_does_not_crash_if_the_caret_is_at_the_beginning_of_the_text() {
        let text = "this is the text that may crash"
        
        let location = textEngine.findPreviousNonBlank(startingAt: 0, in: text)
        
        XCTAssertNil(location) 
    }
    
    func test_that_it_does_not_crash_if_the_caret_is_at_the_end_of_the_text() {
        let text = "this is the text that may crash"
        
        let location = textEngine.findPreviousNonBlank(startingAt: 31, in: text)
        
        XCTAssertNil(location) 
    }
    
}


// TextViews
extension findPreviousNonBlankTests {
    
    func test_that_it_does_stop_at_linefeeds() {
        let text = """
shouldn't go to the previous    
     line
"""

        let location = textEngine.findPreviousNonBlank(startingAt: 37, in: text)
        
        XCTAssertEqual(location, 32)
    }
    
}


// emojis
// see beginningOfWordBackward for the blah blah
extension findPreviousNonBlankTests {
    
    func test_that_it_handles_emojis() {
        let text = "😨️😨️😨️        😨️😨️"
        
        let location = textEngine.findPreviousNonBlank(startingAt: 17, in: text)
        
        XCTAssertEqual(location, 6)
    }
    
}
