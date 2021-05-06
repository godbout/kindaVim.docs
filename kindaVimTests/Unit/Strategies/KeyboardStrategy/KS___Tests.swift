@testable import kindaVim
import XCTest

class KS___Tests: KS_BaseTests {
    
    func test_that___is_getting_transformed_to_control_a_option_right_option_left() {
        let transformedKeys = keyboardStrategy.underscore()

        guard transformedKeys.count == 3 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0], KeyCombination(key: .a, control: true))
        XCTAssertEqual(transformedKeys[1], KeyCombination(key: .right, option: true))
        XCTAssertEqual(transformedKeys[2], KeyCombination(key: .left, option: true))
    }
    
}

