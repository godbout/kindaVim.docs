@testable import kindaVim
import XCTest

class KS_yy_Tests: KS_BaseTests {

    func test_that_yy_returns_a_bunch_of_key_combinations() {
        let keyCombinations = ksNormalMode.yy()

        guard keyCombinations.count == 5 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .right, command: true))
        XCTAssertEqual(keyCombinations[1], KeyCombination(key: .left, shift: true, command: true))
        XCTAssertEqual(keyCombinations[2], KeyCombination(key: .left, shift: true, command: true))
        XCTAssertEqual(keyCombinations[3], KeyCombination(key: .c, command: true))
        XCTAssertEqual(keyCombinations[4], KeyCombination(key: .right))
    }

}
