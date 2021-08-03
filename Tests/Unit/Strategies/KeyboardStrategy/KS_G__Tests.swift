@testable import kindaVim
import XCTest

class KS_G__Tests: KS_BaseTests {
    
    // currently changing to option down for dropdowns, etc.
    // will need to see later for AXWebArea and other still unknown roles
    func test_that_G_returns_option_down() {
        let keyCombinations = keyboardStrategy.G()

        guard keyCombinations.count == 1 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .down, option: true))
    }
    
}
