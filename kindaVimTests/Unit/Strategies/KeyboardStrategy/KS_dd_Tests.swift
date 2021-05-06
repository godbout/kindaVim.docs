@testable import kindaVim
import XCTest

class KS_dd_Tests: KS_BaseTests {
    
    func test_that_dd_is_getting_transformed_to_a_big_pile_of_key_combinations() {
        let transformedKeys = keyboardStrategy.dd()

        guard transformedKeys.count == 9 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0], KeyCombination(key: .e, control: true))
        XCTAssertEqual(transformedKeys[1], KeyCombination(key: .a, control: true, shift: true))
        XCTAssertEqual(transformedKeys[2], KeyCombination(key: .delete))
        XCTAssertEqual(transformedKeys[3], KeyCombination(key: .down))
        XCTAssertEqual(transformedKeys[4], KeyCombination(key: .a, control: true))
        XCTAssertEqual(transformedKeys[5], KeyCombination(key: .delete))
        XCTAssertEqual(transformedKeys[6], KeyCombination(key: .a, control: true))
        XCTAssertEqual(transformedKeys[7], KeyCombination(key: .right, option: true))
        XCTAssertEqual(transformedKeys[8], KeyCombination(key: .left, option: true))
    }
    
}

