@testable import kindaVim
import XCTest

class KS_yiw_Tests: KS_BaseTests {

    func test_that_yiw_returns_option_left_option_shift_right_command_c_right() {
        let keyCombinations = ksNormalMode.yiw()

        guard keyCombinations.count == 4 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .left, option: true))
        XCTAssertEqual(keyCombinations[1], KeyCombination(key: .right, option: true, shift: true))
        XCTAssertEqual(keyCombinations[2], KeyCombination(key: .c, command: true))
        XCTAssertEqual(keyCombinations[3], KeyCombination(key: .right))
    }

}


