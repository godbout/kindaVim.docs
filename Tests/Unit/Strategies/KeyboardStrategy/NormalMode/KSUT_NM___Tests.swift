@testable import kindaVim
import KeyCombination
import XCTest

class KS___Tests: KSUT_BaseTests {
    
    func test_that___returns_command_right_command_left() {
        let keyCombinations = ksNormalMode.underscore()

        guard keyCombinations.count == 2 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .right, command: true))
        XCTAssertEqual(keyCombinations[1], KeyCombination(key: .left, command: true))
    }
    
}

