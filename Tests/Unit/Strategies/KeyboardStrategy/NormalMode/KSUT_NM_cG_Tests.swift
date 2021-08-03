@testable import kindaVim
import XCTest

class KS_cG_Tests: KS_BaseTests {
    
    func test_that_cG_returns_a_bunch_of_key_combinations() {
        let keyCombinations = ksNormalMode.cG()

        guard keyCombinations.count == 4 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .left, command: true))
        XCTAssertEqual(keyCombinations[1], KeyCombination(key: .left, command: true))
        XCTAssertEqual(keyCombinations[2], KeyCombination(key: .down, shift: true, command: true))
        XCTAssertEqual(keyCombinations[3], KeyCombination(key: .delete))
    }
    
}
