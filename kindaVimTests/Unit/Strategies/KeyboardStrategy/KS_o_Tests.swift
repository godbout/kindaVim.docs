@testable import kindaVim
import XCTest

class KS_o_Tests: KS_BaseTests {
    
    func test_that_o_gets_transformed_to_command_right_and_enter() {
        let transformedKeys = keyboardStrategy.o()

        guard transformedKeys.count == 2 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .right)
        XCTAssertEqual(transformedKeys[0].command, true)
        XCTAssertEqual(transformedKeys[0].action, .both)
        XCTAssertEqual(transformedKeys[1].key, .enter)
        XCTAssertEqual(transformedKeys[1].action, .both)
    }
    
}
