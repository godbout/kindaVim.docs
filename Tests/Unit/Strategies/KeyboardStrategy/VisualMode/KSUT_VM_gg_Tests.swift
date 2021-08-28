@testable import kindaVim
import KeyCombination
import XCTest


class KSUT_VM_gg_Tests: KSUT_BaseTests {
    
    func test_that_gg_returns_option_shift_up() {
        let keyCombinations = ksVisualMode.gg()
        
        guard keyCombinations.count == 1 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .up, option: true, shift: true))
    }
    
}
