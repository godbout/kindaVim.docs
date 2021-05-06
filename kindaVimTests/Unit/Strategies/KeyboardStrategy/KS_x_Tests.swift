@testable import kindaVim
import XCTest

class KS_x_Tests: KS_BaseTests {
    
    func test_that_x_is_getting_transformed_to_right_delete() {
        let transformedKeys = keyboardStrategy.x()

        guard transformedKeys.count == 1 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0], KeyCombination(key: .d, control: true))
    }
    
}


