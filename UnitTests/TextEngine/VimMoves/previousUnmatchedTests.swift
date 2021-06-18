@testable import kindaVim
import XCTest


// same blah blah as nextUnmatched
class previousUnmatchedTests: TextEngineBaseTests {}


// Both
extension previousUnmatchedTests {
    
    func test_that_if_it_cannot_find_an_unmatched_bracket_it_returns_the_location_it_was_given() {
        let text = "ok we're gonna try to get the XXX here"
        
        let location = textEngine.previousUnmatched("{", before: 1, in: text)
        
        XCTAssertEqual(location, 1) 
    }
    
    func test_that_in_normal_cases_it_works_hehe() {
        let text = " a couple of ( ( )"
        
        let location = textEngine.previousUnmatched("(", before: 15, in: text)
        
        XCTAssertEqual(location, 13)
    }
    
}
