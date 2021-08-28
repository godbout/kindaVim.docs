@testable import kindaVim
import KeyCombination
import XCTest

class KS_l_Tests: KSUT_BaseTests {
    
    func test_that_l_returns_right() {
        let keyCombinations = ksNormalMode.l()

        guard keyCombinations.count == 1 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .right))
    }
    
}
