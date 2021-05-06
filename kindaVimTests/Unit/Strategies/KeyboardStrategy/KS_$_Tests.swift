@testable import kindaVim
import XCTest


class KS_$_Tests: KS_BaseTests {

    func test_that_$_is_getting_transformed_to_control_a() {
        let transformedKeys = keyboardStrategy.dollarSign()

        guard transformedKeys.count == 2 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .right)
        XCTAssertEqual(transformedKeys[0].command, true)
        XCTAssertEqual(transformedKeys[0].action, .both)
        XCTAssertEqual(transformedKeys[1].key, .right)
        XCTAssertEqual(transformedKeys[1].command, true)
        XCTAssertEqual(transformedKeys[1].action, .both)
    }

}
