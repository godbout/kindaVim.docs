@testable import kindaVim
import XCTest

class KS_x_Tests: KS_BaseTests {
    
    func test_that_x_is_getting_transformed_to_right_delete() {
        let transformedKeys = keyboardStrategy.x()

        guard transformedKeys.count == 2 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .right)
        XCTAssertEqual(transformedKeys[0].action, .both)
        XCTAssertEqual(transformedKeys[1].key, .delete)
        XCTAssertEqual(transformedKeys[1].action, .both)
    }
    
}


