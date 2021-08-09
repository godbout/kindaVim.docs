@testable import kindaVim
import XCTest

class KS_dgg_Tests: KSUT_BaseTests {

    func test_that_dgg_returns_a_big_pile_of_key_combinations() {
        let keyCombinations = ksNormalMode.dgg()

        guard keyCombinations.count == 7 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .down))
        XCTAssertEqual(keyCombinations[1], KeyCombination(key: .left, command: true))
        XCTAssertEqual(keyCombinations[2], KeyCombination(key: .left, command: true))
        XCTAssertEqual(keyCombinations[3], KeyCombination(key: .up, shift: true, command: true))
        XCTAssertEqual(keyCombinations[4], KeyCombination(key: .delete))
        XCTAssertEqual(keyCombinations[5], KeyCombination(key: .right, command: true))
        XCTAssertEqual(keyCombinations[6], KeyCombination(key: .left, command: true))
    }

}
