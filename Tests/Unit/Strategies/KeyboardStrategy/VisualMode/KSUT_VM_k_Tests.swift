@testable import kindaVim
import XCTest


class KSUT_VM_k_Tests: KSUT_BaseTests {
    
    func test_that_k_returns_shift_down() {
        let keyCombinations = ksVisualMode.k()

        guard keyCombinations.count == 1 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .up, shift: true))
    }
    
}
