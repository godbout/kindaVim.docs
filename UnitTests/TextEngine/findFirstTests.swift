@testable import kindaVim
import XCTest

class findFirstTests: TextEngineBaseTests {}

// Both
extension findFirstTests {
    
    func test_that_in_normal_setting_it_returns_the_correct_location() {
        let text = "find a z where there is one"
        let location = textEngine.findFirst("z", in: text)
        
        XCTAssertEqual(location, 7)        
    }
    
    func test_that_it_returns_nil_if_it_cannot_find_the_character() {
        let text = """
in this one
there is no
well that letter
that we cannot say
"""
        let location = textEngine.findFirst("z", in: text)
        
        XCTAssertNil(location)
    }
    
}


// TextViews
extension findFirstTests {
    
    func test_that_it_does_return_the_first_of_a_whole_multiline_not_just_first_of_the_line() {
        let text = """
there's a z here
but also one here z
and even z here!
"""
        let location = textEngine.findFirst("z", in: text)
        
        XCTAssertEqual(location, 10) 
    }
    
}
