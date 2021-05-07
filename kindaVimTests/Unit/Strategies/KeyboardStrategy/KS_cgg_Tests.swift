@testable import kindaVim
import XCTest

class KS_cgg_Tests: KS_BaseTests {

    func test_that_cgg_is_getting_transformed_to_control_e_shift_command_up_delete() {
        let transformedKeys = keyboardStrategy.cgg()

        guard transformedKeys.count == 3 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0], KeyCombination(key: .e, control: true))
        XCTAssertEqual(transformedKeys[1], KeyCombination(key: .up, shift: true, command: true))
        XCTAssertEqual(transformedKeys[2], KeyCombination(key: .delete))
    }

}
