@testable import kindaVim
import XCTest

class KS_I__Tests: KS_BaseTests {
    
    func test_that_I_returns_control_a() {
        let keyCombinations = keyboardStrategy.I()

        guard keyCombinations.count == 2 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .right, command: true))
        XCTAssertEqual(keyCombinations[1], KeyCombination(key: .left, command: true))
    }
    
}
