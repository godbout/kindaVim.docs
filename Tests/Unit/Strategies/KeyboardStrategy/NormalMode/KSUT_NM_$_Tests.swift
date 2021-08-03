@testable import kindaVim
import XCTest


class KS_$_Tests: KS_BaseTests {

    func test_that_$_returns_command_right() {
        let keyCombinations = ksNormalMode.dollarSign()

        guard keyCombinations.count == 1 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .right, command: true))
    }

}
