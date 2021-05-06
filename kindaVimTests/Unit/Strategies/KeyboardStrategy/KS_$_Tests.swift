@testable import kindaVim
import XCTest


class KS_$_Tests: KS_BaseTests {

    func test_that_$_is_getting_transformed_to_control_a() {
        let transformedKeys = keyboardStrategy.dollarSign()

        guard transformedKeys.count == 1 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .e)
        XCTAssertEqual(transformedKeys[0].control, true)
        XCTAssertEqual(transformedKeys[0].action, .both)
    }

}
