@testable import kindaVim
import XCTest

class KS_control_u_Tests: KS_BaseTests {
    
    func test_that_control_u_returns_fn_up() {
        let keyCombinations = keyboardStrategy.controlU()
        
        guard keyCombinations.count == 1 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .fnUp))
    }
    
}


