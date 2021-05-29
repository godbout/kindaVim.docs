@testable import kindaVim
import XCTest

class KS_s_Tests: KS_BaseTests {

    func test_that_s_returns_control_d() {
        let keyCombinations = keyboardStrategy.s()

        guard keyCombinations.count == 1 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .d, control: true))
    }

}
