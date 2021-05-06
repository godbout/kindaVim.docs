@testable import kindaVim
import XCTest

class KS_cc_Tests: KS_BaseTests {
    
    func test_that_cc_is_getting_transformed_to_command_right_command_shift_left_delete() {
        let transformedKeys = keyboardStrategy.cc()

        guard transformedKeys.count == 3 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .e)
        XCTAssertEqual(transformedKeys[0].control, true)
        XCTAssertEqual(transformedKeys[0].action, .both)
        XCTAssertEqual(transformedKeys[1].key, .a)
        XCTAssertEqual(transformedKeys[1].control, true)
        XCTAssertEqual(transformedKeys[1].shift, true)
        XCTAssertEqual(transformedKeys[1].action, .both)
        XCTAssertEqual(transformedKeys[2].key, .delete)
        XCTAssertEqual(transformedKeys[2].action, .both)
    }
    
}

