@testable import kindaVim
import XCTest

class KS_control_r_Tests: KS_BaseTests {
    
    func test_that_control_r_returns_command_shift_z() {
        let keyCombinations = keyboardStrategy.controlR()

        guard keyCombinations.count == 2 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .z, shift: true, command: true))
        // gross undo/redo for now until we understand the UndoManager API
        XCTAssertEqual(keyCombinations[1], KeyCombination(key: .right, shift: true))
    }
    
}


