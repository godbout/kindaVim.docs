@testable import kindaVim
import XCTest

class KS_dG_Tests: KS_BaseTests {

    func test_that_dG_returns_control_a_shift_command_down_delete() {
        let keyCombinations = keyboardStrategy.dG()

        guard keyCombinations.count == 3 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .a, control: true))
        XCTAssertEqual(keyCombinations[1], KeyCombination(key: .down, shift: true, command: true))
        XCTAssertEqual(keyCombinations[2], KeyCombination(key: .delete))
    }

}
