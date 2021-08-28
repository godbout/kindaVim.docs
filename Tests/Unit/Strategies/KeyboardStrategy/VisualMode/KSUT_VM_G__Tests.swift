@testable import kindaVim
import KeyCombination
import XCTest


class KSUT_VM_G__Tests: KSUT_BaseTests {
    
    func test_that_G_returns_option_shift_down() {
        let keyCombinations = ksVisualMode.G()
        
        guard keyCombinations.count == 1 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .down, option: true, shift: true))
    }
    
}
