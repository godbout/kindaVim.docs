@testable import kindaVim
import XCTest

class KS_X__Tests: KS_BaseTests {
    
    func test_that_X_returns_delete() {
        let keyCombinations = keyboardStrategy.X()

        guard keyCombinations.count == 1 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .delete))
    }
    
}


