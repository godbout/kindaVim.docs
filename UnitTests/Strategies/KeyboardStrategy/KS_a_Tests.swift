@testable import kindaVim
import XCTest

class KS_a_Tests: KS_BaseTests {
    
    func test_that_a_returns_right() {
        let keyCombinations = keyboardStrategy.a()

        guard keyCombinations.count == 1 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .right))
    }

}
