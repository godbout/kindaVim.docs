@testable import kindaVim
import XCTest

class KS_cc_Tests: KS_BaseTests {
    
    func test_that_cc_is_getting_transformed_to_command_right_command_shift_left_delete() {
        let transformedKeys = keyboardStrategy.cc()

        guard transformedKeys.count == 3 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0], KeyCombination(key: .e, control: true))
        XCTAssertEqual(transformedKeys[1], KeyCombination(key: .a, control: true, shift: true))
        XCTAssertEqual(transformedKeys[2], KeyCombination(key: .delete))
    }
    
}

