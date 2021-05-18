@testable import kindaVim
import XCTest

class KS_o_Tests: KS_BaseTests {
    
    func test_that_o_returns_control_e_enter() {
        let keyCombinations = keyboardStrategy.o()

        guard keyCombinations.count == 2 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .right, command: true))
        XCTAssertEqual(keyCombinations[1], KeyCombination(key: .enter))
    }
    
}
