@testable import kindaVim
import XCTest

class KS_I__Tests: KS_BaseTests {
    
    func test_that_I_gets_transformed_to_command_left() {
        let transformedKeys = keyboardStrategy.I()

        guard transformedKeys.count == 1 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .a)
        XCTAssertEqual(transformedKeys[0].control, true)
        XCTAssertEqual(transformedKeys[0].action, .both)
    }
    
}
