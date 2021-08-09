@testable import kindaVim
import XCTest

class KS_w_Tests: KSUT_BaseTests {
    
    func test_that_w_returns_option_right_option_right_option_left() {
        let keyCombinations = ksNormalMode.w()

        guard keyCombinations.count == 3 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .right, option: true))
        XCTAssertEqual(keyCombinations[1], KeyCombination(key: .right, option: true))
        XCTAssertEqual(keyCombinations[2], KeyCombination(key: .left, option: true))
    }
    
}


