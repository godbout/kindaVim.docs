@testable import kindaVim
import XCTest

class KS_cgg_Tests: KSUT_NM_BaseTests {

    func test_that_cgg_returns_command_right_shift_command_up_delete() {
        let keyCombinations = ksNormalMode.cgg()

        guard keyCombinations.count == 3 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .right, command: true))
        XCTAssertEqual(keyCombinations[1], KeyCombination(key: .up, shift: true, command: true))
        XCTAssertEqual(keyCombinations[2], KeyCombination(key: .delete))
    }

}
