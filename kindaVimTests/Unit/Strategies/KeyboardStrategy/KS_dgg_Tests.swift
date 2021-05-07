@testable import kindaVim
import XCTest

class KS_dgg_Tests: KS_BaseTests {

    func test_that_dgg_is_getting_transformed_to_a_big_file_of_key_combinations() {
        let transformedKeys = keyboardStrategy.dgg()

        guard transformedKeys.count == 6 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0], KeyCombination(key: .down))
        XCTAssertEqual(transformedKeys[1], KeyCombination(key: .a, control: true))
        XCTAssertEqual(transformedKeys[2], KeyCombination(key: .up, shift: true, command: true))
        XCTAssertEqual(transformedKeys[3], KeyCombination(key: .delete))
        XCTAssertEqual(transformedKeys[4], KeyCombination(key: .right, option: true))
        XCTAssertEqual(transformedKeys[5], KeyCombination(key: .left, option: true))
    }

}
