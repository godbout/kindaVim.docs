@testable import kindaVim
import XCTest

class KS_yiw_Tests: KS_BaseTests {

    func test_that_yiw_is_getting_transformed_to_option_left_option_shift_right_command_c_right() {
        let transformedKeys = keyboardStrategy.yiw()

        guard transformedKeys.count == 4 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0], KeyCombination(key: .left, option: true, action: .both))
        XCTAssertEqual(transformedKeys[1], KeyCombination(key: .right, option: true, shift: true, action: .both))
        XCTAssertEqual(transformedKeys[2], KeyCombination(key: .c, command: true))
        XCTAssertEqual(transformedKeys[3], KeyCombination(key: .right, action: .both))
    }

}


