@testable import kindaVim
import XCTest

class KS_C__Tests: KS_BaseTests {
    
    func test_that_C_is_getting_transformed_to_command_shift_right_delete() {
        let transformedKeys = keyboardStrategy.C()

        guard transformedKeys.count == 2 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0], KeyCombination(key: .e, control: true, shift: true))
        XCTAssertEqual(transformedKeys[1], KeyCombination(key: .delete))
    }
    
}

