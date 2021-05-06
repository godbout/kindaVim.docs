@testable import kindaVim
import XCTest

class KS_X__Tests: KS_BaseTests {
    
    func test_that_X_is_getting_transformed_to_delete() {
        let transformedKeys = keyboardStrategy.X()

        guard transformedKeys.count == 1 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .delete)
        XCTAssertEqual(transformedKeys[0].action, .both)
    }
    
}


