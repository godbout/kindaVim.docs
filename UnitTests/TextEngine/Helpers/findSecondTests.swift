@testable import kindaVim
import XCTest

class findSecondTests: TextEngineBaseTests {}

// Both
extension findSecondTests {
    
    func test_that_in_normal_setting_it_returns_the_correct_location() {
        let text = """
some text with at least two " in " it
"""
        let location = textEngine.findSecond("\"", in: text)
        
        XCTAssertEqual(location, 33)        
    }
    
    func test_that_if_there_is_no_second_occurrence_it_returns_nil() {
        let text = "there's only one...i cannot say haha"
        
        let location = textEngine.findSecond("l", in: text)
        
        XCTAssertNil(location)
    }
    
    func test_that_it_returns_nil_for_an_empty_line() {
        let text = ""
        
        let location = textEngine.findSecond("a", in: text)
        
        XCTAssertNil(location)
    }
    
}
