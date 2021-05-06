@testable import kindaVim
import XCTest

class KS_b_Tests: KS_BaseTests {

    func test_that_b_is_getting_transformed_to_alt_left() {
        let transformedKeys = keyboardStrategy.b()

        guard transformedKeys.count == 1 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .left)
        XCTAssertEqual(transformedKeys[0].option, true)
        XCTAssertEqual(transformedKeys[0].action, .both)
    }
    
}

