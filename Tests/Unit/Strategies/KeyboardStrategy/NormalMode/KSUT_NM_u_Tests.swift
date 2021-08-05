@testable import kindaVim
import XCTest

class KS_u_Tests: KSUT_NM_BaseTests {
    
    func test_that_u_returns_command_z() {
        let keyCombinations = ksNormalMode.u()
        
        guard keyCombinations.count == 3 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .z, command: true))
        // gross undo/redo for now until we understand the UndoManager API
        XCTAssertEqual(keyCombinations[1], KeyCombination(key: .left))
        XCTAssertEqual(keyCombinations[2], KeyCombination(key: .right, shift: true))
    }
    
}


