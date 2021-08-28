@testable import kindaVim
import KeyCombination
import XCTest

class KS_j_Tests: KSUT_BaseTests {
    
    func test_that_j_returns_down() {
        let keyCombinations = ksNormalMode.j()

        guard keyCombinations.count == 1 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .down))
    }
    
}
