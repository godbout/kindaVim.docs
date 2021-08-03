@testable import kindaVim
import XCTest

class KS_gg_Tests: KS_BaseTests {
    
    // see G for blah blah
    func test_that_gg_returns_option_up() {
        let keyCombinations = ksNormalMode.gg()

        guard keyCombinations.count == 1 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .up, option: true))
    }
    
}
