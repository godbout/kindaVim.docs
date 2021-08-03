@testable import kindaVim
import XCTest

class KS_x_Tests: KS_BaseTests {
    
    func test_that_x_returns_control_d() {
        let keyCombinations = ksNormalMode.x()

        guard keyCombinations.count == 1 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .d, control: true))
    }
    
}
