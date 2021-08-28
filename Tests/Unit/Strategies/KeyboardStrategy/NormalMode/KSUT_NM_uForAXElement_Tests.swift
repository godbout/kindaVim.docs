@testable import kindaVim
import KeyCombination
import XCTest

class KS_uForAXElement_Tests: KSUT_BaseTests {
    
    // gross undo/redo for now until we understand the UndoManager API
    func test_that_uForAXElement_returns_command_z_plus_some_stuff_to_pretend_a_block_cursor() {
        let keyCombinations = ksNormalMode.uForAXElement()
        
        guard keyCombinations.count == 3 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .z, command: true))
        XCTAssertEqual(keyCombinations[1], KeyCombination(key: .left))
        XCTAssertEqual(keyCombinations[2], KeyCombination(key: .right, shift: true))
    }
    
}
