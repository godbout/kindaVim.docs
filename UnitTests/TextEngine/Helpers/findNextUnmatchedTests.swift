@testable import kindaVim
import XCTest


class findNextUnmatchedTests: TextEngineBaseTests {}


// Both
extension findNextUnmatchedTests {
    
    func test_that_in_normal_setting_it_finds_the_next_unmatched_bracket() {
        let text = "here we go { again } ho ho ho ho }"
        
        let location = textEngine.findNextUnmatched("}", after: 4, in: text)
        
        XCTAssertEqual(location, 33)          
    }
    
    func test_that_it_returns_nil_if_there_is_no_right_bracket() {
        let text = "no left brace in here move along"
        
        let location = textEngine.findNextUnmatched("(", after: 19, in: text)
        
        XCTAssertNil(location)
    }
    
    func test_that_it_returns_nil_if_there_are_only_matched_brackets() {
        let text = "full of ( ) matched ( braces )"
        
        let location = textEngine.findNextUnmatched("(", after: 30, in: text)
        
        XCTAssertNil(location)
    }
      
    func test_that_if_the_caret_is_right_before_a_bracket_it_will_still_find_the_next_unmatched_one() {
        let text = """
so there's a ) here
and another ) here
"""
        let location = textEngine.findNextUnmatched(")", after: 13, in: text)
        
        XCTAssertEqual(location, 32)                
    }
    
}
