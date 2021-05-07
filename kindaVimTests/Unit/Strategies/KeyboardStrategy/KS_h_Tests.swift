@testable import kindaVim
import XCTest

class KS_h_Tests: KS_BaseTests {
    
    func test_that_h_returns_left() {
        let keyCombinations = keyboardStrategy.h()
        
        guard keyCombinations.count == 1 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .left))
    }
    
}
