@testable import kindaVim
import XCTest


// nextUnmatched is like a wrapper around TE.findNextUnmatched
// that will return the same location it was give if a next
// unmatched can't be found (and therefore findNextUnmatched returns
// nil). here we just test this. the rest of findNextUnmatched
// is tested in its own place
class nextUnmatchedTests: TextEngineBaseTests {}


// Both
extension nextUnmatchedTests {
    
    func test_that_if_it_cannot_find_an_unmatched_bracket_it_returns_the_location_it_was_given() {
        let text = "ok we're gonna try to get the inner word here"
        
        let location = textEngine.nextUnmatched("}", after: 4, in: text)
        
        XCTAssertEqual(location, 4) 
    }
    
    func test_that_in_normal_cases_it_works_hehe() {
        let text = " a couple of ( (( ))))  ) O_o"
        
        let location = textEngine.nextUnmatched(")", after: 15, in: text)
        
        XCTAssertEqual(location, 20)
    }
    
}
