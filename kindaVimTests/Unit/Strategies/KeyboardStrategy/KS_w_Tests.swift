@testable import kindaVim
import XCTest

class KS_w_Tests: KS_BaseTests {
    
    func test_that_w_is_getting_transformed_to_option_right_option_right_option_left() {
        let transformedKeys = keyboardStrategy.w()

        guard transformedKeys.count == 3 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0], KeyCombination(key: .right, option: true))
        XCTAssertEqual(transformedKeys[1], KeyCombination(key: .right, option: true))
        XCTAssertEqual(transformedKeys[2], KeyCombination(key: .left, option: true))
    }
    
}


