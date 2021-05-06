@testable import kindaVim
import XCTest

class KS_control_r_Tests: KS_BaseTests {
    
    func test_that_control_r_gets_transformed_to_command_shift_z() {
        let transformedKeys = keyboardStrategy.controlR()

        guard transformedKeys.count == 1 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0], KeyCombination(key: .z, shift: true, command: true))
    }
    
}


