@testable import kindaVim
import XCTest

class KS_ciw_Tests: KS_BaseTests {
    
    func test_that_ciw_returns_option_right_option_left_delete() {
        let keyCombinations = keyboardStrategy.ciw()

        guard keyCombinations.count == 3 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .right, option: true))
        XCTAssertEqual(keyCombinations[1], KeyCombination(key: .left, option: true, shift: true))
        XCTAssertEqual(keyCombinations[2], KeyCombination(key: .delete))
    }
    
}

