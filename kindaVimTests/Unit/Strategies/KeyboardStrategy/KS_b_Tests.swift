@testable import kindaVim
import XCTest

class KS_b_Tests: KS_BaseTests {

    func test_that_b_returns_alt_left() {
        let keyCombinations = keyboardStrategy.b()

        guard keyCombinations.count == 1 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .left, option: true))
    }
    
}

