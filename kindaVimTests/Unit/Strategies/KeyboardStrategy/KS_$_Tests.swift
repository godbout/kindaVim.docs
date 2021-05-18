@testable import kindaVim
import XCTest


class KS_$_Tests: KS_BaseTests {

    func test_that_$_returns_control_e() {
        let keyCombinations = keyboardStrategy.dollarSign()

        guard keyCombinations.count == 1 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .right, command: true))
    }

}
