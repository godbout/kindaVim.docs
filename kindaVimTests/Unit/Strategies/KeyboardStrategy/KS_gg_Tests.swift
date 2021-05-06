@testable import kindaVim
import XCTest

class KS_gg_Tests: KS_BaseTests {
    
    func test_that_gg_is_getting_transformed_to_command_up() {
        let transformedKeys = keyboardStrategy.gg()

        guard transformedKeys.count == 1 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0], KeyCombination(key: .up, command: true))
    }
    
}
