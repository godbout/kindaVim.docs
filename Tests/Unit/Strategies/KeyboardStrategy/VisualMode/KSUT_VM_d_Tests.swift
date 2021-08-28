@testable import kindaVim
import KeyCombination
import XCTest


class KSUT_VM_d_Tests: KSUT_BaseTests {
    
    func test_that_d_returns_delete() {
        let keyCombinations = ksVisualMode.d()

        guard keyCombinations.count == 1 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .delete))
    }
    
}
