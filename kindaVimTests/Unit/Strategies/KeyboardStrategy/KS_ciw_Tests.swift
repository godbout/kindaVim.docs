@testable import kindaVim
import XCTest

class KS_ciw_Tests: KS_BaseTests {
    
    func test_that_ciw_is_getting_transformed_to_option_right_option_left_delete() {
        let transformedKeys = keyboardStrategy.ciw()

        guard transformedKeys.count == 3 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0], KeyCombination(key: .right, option: true))
        XCTAssertEqual(transformedKeys[1], KeyCombination(key: .left, option: true, shift: true))
        XCTAssertEqual(transformedKeys[2], KeyCombination(key: .delete))
    }
    
}

