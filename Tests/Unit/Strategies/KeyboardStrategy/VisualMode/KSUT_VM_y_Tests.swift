@testable import kindaVim
import KeyCombination
import XCTest


class KSUT_VM_y_Tests: KSUT_BaseTests {
    
    func test_that_y_returns_command_c() {
        let keyCombinations = ksVisualMode.y()
        
        guard keyCombinations.count == 1 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .c, command: true))
    }
    
}
