@testable import kindaVim
import XCTest

class KS_yy_Tests: KS_BaseTests {

    func test_that_yy_returns_control_e_control_shift_a_command_c_right() {
        let keyCombinations = keyboardStrategy.yy()

        guard keyCombinations.count == 4 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .e, control: true))
        XCTAssertEqual(keyCombinations[1], KeyCombination(key: .a, control: true, shift:true))
        XCTAssertEqual(keyCombinations[2], KeyCombination(key: .c, command: true))
        XCTAssertEqual(keyCombinations[3], KeyCombination(key: .right))
    }

}
