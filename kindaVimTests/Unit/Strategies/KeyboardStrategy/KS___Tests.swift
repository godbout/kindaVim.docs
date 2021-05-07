@testable import kindaVim
import XCTest

class KS___Tests: KS_BaseTests {
    
    func test_that___returns_control_a_option_right_option_left() {
        let keyCombinations = keyboardStrategy.underscore()

        guard keyCombinations.count == 3 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .a, control: true))
        XCTAssertEqual(keyCombinations[1], KeyCombination(key: .right, option: true))
        XCTAssertEqual(keyCombinations[2], KeyCombination(key: .left, option: true))
    }
    
}

