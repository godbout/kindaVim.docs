@testable import kindaVim
import XCTest

class KS_u_Tests: KS_BaseTests {
    
    func test_that_u_returns_command_z() {
        let keyCombinations = keyboardStrategy.u()
        
        guard keyCombinations.count == 1 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .z, command: true))
    }
    
}


