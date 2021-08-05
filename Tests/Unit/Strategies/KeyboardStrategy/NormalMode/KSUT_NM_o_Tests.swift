@testable import kindaVim
import XCTest

class KS_o_Tests: KSUT_NM_BaseTests {
    
    func test_that_o_returns_command_right_enter() {
        let keyCombinations = ksNormalMode.o()

        guard keyCombinations.count == 2 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .right, command: true))
        XCTAssertEqual(keyCombinations[1], KeyCombination(key: .enter))
    }
    
}
