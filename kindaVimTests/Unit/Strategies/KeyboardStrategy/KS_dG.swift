@testable import kindaVim
import XCTest

class KS_dG_Tests: KS_BaseTests {

    func test_that_dG_is_getting_transformed_to_control_a_shift_command_down_delete() {
        let transformedKeys = keyboardStrategy.dG()

        guard transformedKeys.count == 3 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0], KeyCombination(key: .a, control: true))
        XCTAssertEqual(transformedKeys[1], KeyCombination(key: .down, shift: true, command: true))
        XCTAssertEqual(transformedKeys[2], KeyCombination(key: .delete))
    }

}
