@testable import kindaVim
import XCTest

class KS_h_Tests: KSUT_BaseTests {
    
    func test_that_h_returns_left() {
        let keyCombinations = ksNormalMode.h()
        
        guard keyCombinations.count == 1 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .left))
    }
    
}
