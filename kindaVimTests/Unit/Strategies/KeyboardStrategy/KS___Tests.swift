@testable import kindaVim
import XCTest

class KS___Tests: KS_BaseTests {
    
    func test_that___returns_control_a_option_right_option_left() {
        let keyCombinations = keyboardStrategy.underscore()

        guard keyCombinations.count == 2 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .right, command: true))
        XCTAssertEqual(keyCombinations[1], KeyCombination(key: .left, command: true))
    }
    
}

