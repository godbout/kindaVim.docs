@testable import kindaVim
import XCTest

class KS_0_Tests: KS_BaseTests {
    
    func test_that_0_returns_control_a() {
        let keyCombinations = keyboardStrategy.zero()

        guard keyCombinations.count == 2 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .left, command: true))
        XCTAssertEqual(keyCombinations[1], KeyCombination(key: .left, command: true))
    }
    
}

