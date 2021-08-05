@testable import kindaVim
import XCTest

class KS_A__Tests: KSUT_NM_BaseTests {
    
    func test_that_A_returns_command_right() {
        let keyCombinations = ksNormalMode.A()

        guard keyCombinations.count == 1 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .right, command: true))
    }
    
}
