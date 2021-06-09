@testable import kindaVim
import XCTest


class previousNonBlankTests: TextEngineBaseTests {}


// Both
extension previousNonBlankTests {
    
    func test_that_in_normal_setting_it_finds_the_previous_non_blank_location() {
        let text = "those are        spaces!"
        
        let location = textEngine.previousNonBlank(before: 15, in: text)
        
        XCTAssertEqual(location, 8)          
    }
    
    func test_that_if_the_caret_is_on_a_single_blank_then_it_returns_the_correct_location() {
        let text = "those are not many spaces!"
        
        let location = textEngine.previousNonBlank(before: 13, in: text)
        
        XCTAssertEqual(location, 12)  
    }
    
    func test_that_if_there_is_no_non_blank_then_it_returns_the_start_of_the_line() {
        let text = "           many spaces!"
        
        let location = textEngine.previousNonBlank(before: 11, in: text)
        
        XCTAssertEqual(location, 0) 
    }
    
}


// TextViews
extension previousNonBlankTests {
    
    
    
}
