@testable import kindaVim
import XCTest

class KS_I__Tests: KSUT_BaseTests {
    
    func test_that_I_returns_command_right_command_left() {
        let keyCombinations = ksNormalMode.I()

        guard keyCombinations.count == 2 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .right, command: true))
        XCTAssertEqual(keyCombinations[1], KeyCombination(key: .left, command: true))
    }
    
}
