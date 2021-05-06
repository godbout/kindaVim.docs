@testable import kindaVim
import XCTest

class KS___Tests: KS_BaseTests {
    
    func test_that___is_getting_transformed_to_control_a_option_right_option_left() {
        let transformedKeys = keyboardStrategy.underscore()

        guard transformedKeys.count == 3 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .a)
        XCTAssertEqual(transformedKeys[0].control, true)
        XCTAssertEqual(transformedKeys[0].action, .both)
        XCTAssertEqual(transformedKeys[1].key, .right)
        XCTAssertEqual(transformedKeys[1].option, true)
        XCTAssertEqual(transformedKeys[1].action, .both)
        XCTAssertEqual(transformedKeys[2].key, .left)
        XCTAssertEqual(transformedKeys[2].option, true)
        XCTAssertEqual(transformedKeys[2].action, .both)
    }
    
}

