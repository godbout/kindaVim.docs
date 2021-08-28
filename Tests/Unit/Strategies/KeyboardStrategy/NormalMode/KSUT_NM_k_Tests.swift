@testable import kindaVim
import KeyCombination
import XCTest

class KS_k_Tests: KSUT_BaseTests {
    
    func test_that_k_returns_up() {
        let keyCombinations = ksNormalMode.k()

        guard keyCombinations.count == 1 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .up))
    }
    
}
