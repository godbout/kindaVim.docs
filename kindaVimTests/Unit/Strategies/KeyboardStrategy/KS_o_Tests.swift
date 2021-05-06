@testable import kindaVim
import XCTest

class KS_o_Tests: KS_BaseTests {
    
    func test_that_o_gets_transformed_to_command_right_and_enter() {
        let transformedKeys = keyboardStrategy.o()

        guard transformedKeys.count == 2 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0], KeyCombination(key: .e, control: true))
        XCTAssertEqual(transformedKeys[1], KeyCombination(key: .enter))
    }
    
}
