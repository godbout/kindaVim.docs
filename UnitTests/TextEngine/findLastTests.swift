@testable import kindaVim
import XCTest

class findLastTests: TextEngineBaseTests {}

// Both
extension findLastTests {
    
    func test_that_in_normal_setting_it_returns_the_correct_location() {
        let text = "we should get the location of the last character found!"
        let location = textEngine.findLast("f", in: text)
        
        XCTAssertEqual(location, 49)
    }
    
    func test_that_if_it_cannot_find_the_character_it_returns_nil() {
        let text = "can't find the character hehe"
        let location = textEngine.findLast("z", in: text)
        
        XCTAssertEqual(location, nil)
    }

}
