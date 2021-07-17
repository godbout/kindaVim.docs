@testable import kindaVim
import XCTest

class KS_l_Tests: KS_BaseTests {
    
    func test_that_l_returns_right() {
        let keyCombinations = keyboardStrategy.l()

        guard keyCombinations.count == 1 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .right))
    }
    
}
