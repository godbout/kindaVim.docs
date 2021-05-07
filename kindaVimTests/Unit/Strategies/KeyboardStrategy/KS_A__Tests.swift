@testable import kindaVim
import XCTest

class KS_A__Tests: KS_BaseTests {
    
    func test_that_A_returns_command_right() {
        let keyCombinations = keyboardStrategy.A()

        guard keyCombinations.count == 1 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .e, control: true))
    }
    
}
