@testable import kindaVim
import XCTest

class KS_cb_Tests: KSUT_BaseTests {

    func test_that_cb_returns_option_delete() {
        let keyCombinations = ksNormalMode.cb()

        guard keyCombinations.count == 1 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .delete, option: true))
    }

}
