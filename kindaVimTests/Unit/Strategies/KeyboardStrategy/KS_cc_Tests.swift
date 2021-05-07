@testable import kindaVim
import XCTest

class KS_cc_Tests: KS_BaseTests {
    
    func test_that_cc_returns_control_e_control_shift_a_delete() {
        let keyCombinations = keyboardStrategy.cc()

        guard keyCombinations.count == 3 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .e, control: true))
        XCTAssertEqual(keyCombinations[1], KeyCombination(key: .a, control: true, shift: true))
        XCTAssertEqual(keyCombinations[2], KeyCombination(key: .delete))
    }
    
}

