@testable import kindaVim
import XCTest

class findFirstTests: TextEngineBaseTests {}

// Both
extension findFirstTests {
    
    func test_that_in_normal_setting_it_returns_the_correct_location() {
        let text = """
some text with at least one " in it
"""
        let location = textEngine.findFirst("\"", in: text)
        
        XCTAssertEqual(location, 28)        
    }
    
    
    
}


// TextViews
extension findFirstTests {
    
    
}
