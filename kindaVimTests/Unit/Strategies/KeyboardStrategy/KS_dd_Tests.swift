@testable import kindaVim
import XCTest

class KS_dd_Tests: KS_BaseTests {
    
    func test_that_dd_returns_a_big_pile_of_key_combinations() {
        let keyCombinations = keyboardStrategy.dd()

        guard keyCombinations.count == 9 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .e, control: true))
        XCTAssertEqual(keyCombinations[1], KeyCombination(key: .a, control: true, shift: true))
        XCTAssertEqual(keyCombinations[2], KeyCombination(key: .delete))
        XCTAssertEqual(keyCombinations[3], KeyCombination(key: .down))
        XCTAssertEqual(keyCombinations[4], KeyCombination(key: .a, control: true))
        XCTAssertEqual(keyCombinations[5], KeyCombination(key: .delete))
        XCTAssertEqual(keyCombinations[6], KeyCombination(key: .a, control: true))
        XCTAssertEqual(keyCombinations[7], KeyCombination(key: .right, option: true))
        XCTAssertEqual(keyCombinations[8], KeyCombination(key: .left, option: true))
    }
    
}

