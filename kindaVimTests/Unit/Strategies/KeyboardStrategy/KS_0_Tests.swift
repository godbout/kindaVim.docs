@testable import kindaVim
import XCTest

class KS_0_Tests: KS_BaseTests {
    
    func test_that_0_returns_control_a() {
        let keyCombinations = keyboardStrategy.zero()

        guard keyCombinations.count == 1 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .a, control: true))
    }
    
}

