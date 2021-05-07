@testable import kindaVim
import XCTest

class KS_C__Tests: KS_BaseTests {
    
    func test_that_C_returns_control_shift_e_delete() {
        let keyCombinations = keyboardStrategy.C()

        guard keyCombinations.count == 2 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .e, control: true, shift: true))
        XCTAssertEqual(keyCombinations[1], KeyCombination(key: .delete))
    }
    
}

