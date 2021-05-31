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
    
    
    
}


// TextViews
extension findSecondTests {
    
    
}
