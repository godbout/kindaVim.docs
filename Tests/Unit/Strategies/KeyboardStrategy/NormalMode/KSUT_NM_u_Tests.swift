@testable import kindaVim
import XCTest

class KS_u_Tests: KSUT_BaseTests {
    
    func test_that_u_returns_command_z() {
        let keyCombinations = ksNormalMode.u()
        
        guard keyCombinations.count == 1 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .z, command: true))
    }
    
}
