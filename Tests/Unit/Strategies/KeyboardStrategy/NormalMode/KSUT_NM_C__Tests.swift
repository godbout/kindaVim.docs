@testable import kindaVim
import XCTest

class KS_C__Tests: KSUT_NM_BaseTests {
    
    func test_that_C_returns_command_right_delete() {
        let keyCombinations = ksNormalMode.C()

        guard keyCombinations.count == 2 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .right, shift: true, command: true))
        XCTAssertEqual(keyCombinations[1], KeyCombination(key: .delete))
    }
    
}

