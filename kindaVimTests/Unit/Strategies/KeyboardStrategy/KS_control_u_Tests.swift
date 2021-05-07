@testable import kindaVim
import XCTest

class KS_control_u_Tests: KS_BaseTests {
    
    func test_that_control_u_gets_transformed_to_fn_up() {
        let transformedKeys = keyboardStrategy.controlU()
        
        guard transformedKeys.count == 1 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0], KeyCombination(key: .fnUp))
    }
    
}


