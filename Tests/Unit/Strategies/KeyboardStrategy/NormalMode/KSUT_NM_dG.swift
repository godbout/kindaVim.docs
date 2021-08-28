@testable import kindaVim
import KeyCombination
import XCTest

class KS_dG_Tests: KSUT_BaseTests {

    func test_that_dG_returns_a_bunch_of_key_combinations() {
        let keyCombinations = ksNormalMode.dG()

        guard keyCombinations.count == 4 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .left, command: true))
        XCTAssertEqual(keyCombinations[1], KeyCombination(key: .left, command: true))
        XCTAssertEqual(keyCombinations[2], KeyCombination(key: .down, shift: true, command: true))
        XCTAssertEqual(keyCombinations[3], KeyCombination(key: .delete))
    }

}
