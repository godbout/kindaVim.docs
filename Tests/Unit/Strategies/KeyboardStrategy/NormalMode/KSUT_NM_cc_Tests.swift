@testable import kindaVim
import XCTest

class KS_cc_Tests: KSUT_BaseTests {
    
    func test_that_cc_returns_command_right_shift_command_left_delete() {
        let keyCombinations = ksNormalMode.cc()

        guard keyCombinations.count == 3 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .right, command: true))
        XCTAssertEqual(keyCombinations[1], KeyCombination(key: .left, shift: true, command: true))
        XCTAssertEqual(keyCombinations[2], KeyCombination(key: .delete))
    }
    
}

