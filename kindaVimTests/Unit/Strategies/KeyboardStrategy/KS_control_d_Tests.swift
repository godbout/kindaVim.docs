@testable import kindaVim
import XCTest

class KS_control_d_Tests: KS_BaseTests {
    
    func test_that_control_d_gets_transformed_to_fn_down() {
        let transformedKeys = keyboardStrategy.controlD()
        
        guard transformedKeys.count == 1 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0], KeyCombination(key: .fnDown))
    }
    
}


