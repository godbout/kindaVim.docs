@testable import kindaVim
import XCTest

class KS_j_Tests: KS_BaseTests {
    
    func test_that_j_returns_down() {
        let keyCombinations = ksNormalMode.j()

        guard keyCombinations.count == 1 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .down))
    }
    
}
