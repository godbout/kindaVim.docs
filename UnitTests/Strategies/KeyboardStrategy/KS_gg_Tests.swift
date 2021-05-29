@testable import kindaVim
import XCTest

class KS_gg_Tests: KS_BaseTests {
    
    func test_that_gg_returns_command_up_command_right_option_left() {
        let keyCombinations = keyboardStrategy.gg()

        guard keyCombinations.count == 3 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .up, command: true))
        XCTAssertEqual(keyCombinations[1], KeyCombination(key: .right, command: true))
        XCTAssertEqual(keyCombinations[2], KeyCombination(key: .left, option : true))
    }
    
}
