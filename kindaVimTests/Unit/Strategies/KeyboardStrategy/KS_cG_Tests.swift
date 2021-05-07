@testable import kindaVim
import XCTest

class KS_cG_Tests: KS_BaseTests {
    
    func test_that_cG_returns_control_a_shift_command_down_delete() {
        let keyCombinations = keyboardStrategy.cG()

        guard keyCombinations.count == 3 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .a, control: true))
        XCTAssertEqual(keyCombinations[1], KeyCombination(key: .down, shift: true, command: true))
        XCTAssertEqual(keyCombinations[2], KeyCombination(key: .delete))
    }
    
}
