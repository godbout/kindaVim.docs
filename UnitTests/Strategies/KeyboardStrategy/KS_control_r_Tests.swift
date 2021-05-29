@testable import kindaVim
import XCTest

class KS_control_r_Tests: KS_BaseTests {
    
    func test_that_control_r_returns_command_shift_z() {
        let keyCombinations = keyboardStrategy.controlR()

        guard keyCombinations.count == 1 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .z, shift: true, command: true))
    }
    
}


