@testable import kindaVim
import XCTest

class KS_caret_Tests: KSUT_NM_BaseTests {
    
    func test_that_caret_returns_command_right_option_right_option_left() {
        let keyCombinations = ksNormalMode.caret()

        guard keyCombinations.count == 3 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .left, command: true))
        XCTAssertEqual(keyCombinations[1], KeyCombination(key: .right, option: true))
        XCTAssertEqual(keyCombinations[2], KeyCombination(key: .left, option: true))
    }
    
}

