@testable import kindaVim
import XCTest

class KS_yy_Tests: KS_BaseTests {

    func test_that_yy_is_getting_transformed_to_delete() {
        let transformedKeys = keyboardStrategy.yy()

        guard transformedKeys.count == 4 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0], KeyCombination(key: .e, control: true, action: .both))
        XCTAssertEqual(transformedKeys[1], KeyCombination(key: .a, control: true, shift:true, action: .both))
        XCTAssertEqual(transformedKeys[2], KeyCombination(key: .c, command: true, action: .both))
        XCTAssertEqual(transformedKeys[3], KeyCombination(key: .right, action: .both))
    }

}
