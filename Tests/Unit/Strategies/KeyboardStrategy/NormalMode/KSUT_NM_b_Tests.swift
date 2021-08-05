@testable import kindaVim
import XCTest

class KS_b_Tests: KSUT_NM_BaseTests {

    func test_that_b_returns_option_left() {
        let keyCombinations = ksNormalMode.b()

        guard keyCombinations.count == 1 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .left, option: true))
    }
    
}

