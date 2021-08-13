@testable import kindaVim
import XCTest


class KSUT_NM_P__Tests: KSUT_BaseTests {
    
    func test_that_P_returns_command_v() {
        let keyCombinations = ksNormalMode.P()
        
        guard keyCombinations.count == 1 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .v, command: true))
    }
    
}
