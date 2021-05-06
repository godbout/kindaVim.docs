@testable import kindaVim
import XCTest

class KS_ciw_Tests: KS_BaseTests {
    
    func test_that_ciw_is_getting_transformed_to_option_right_option_left_delete() {
        let transformedKeys = keyboardStrategy.ciw()

        guard transformedKeys.count == 3 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .right)
        XCTAssertEqual(transformedKeys[0].option, true)
        XCTAssertEqual(transformedKeys[0].action, .both)
        XCTAssertEqual(transformedKeys[1].key, .left)
        XCTAssertEqual(transformedKeys[1].option, true)
        XCTAssertEqual(transformedKeys[1].action, .both)
        XCTAssertEqual(transformedKeys[2].key, .delete)
        XCTAssertEqual(transformedKeys[2].action, .both)
    }
    
}

