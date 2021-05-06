@testable import kindaVim
import XCTest

class KS_l_Tests: KS_BaseTests {
    
    func test_that_l_is_getting_transformed_to_right() {
        let transformedKeys = keyboardStrategy.l()

        guard transformedKeys.count == 1 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0], KeyCombination(key: .right))
    }
    
}
