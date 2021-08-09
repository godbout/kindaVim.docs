@testable import kindaVim
import XCTest


class KSUT_NM_p_Tests: KSUT_BaseTests {
    
    func test_that_p_returns_command_v() {
        let keyCombinations = ksNormalMode.p()
        
        guard keyCombinations.count == 1 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .v, command: true))
    }
    
}
