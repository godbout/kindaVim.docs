@testable import kindaVim
import KeyCombination
import XCTest

class KS_r_Tests: KSUT_BaseTests {

    func test_that_ra_returns_control_d_a_left() {
        let keyCombinations = ksNormalMode.r(with: KeyCombination(key: .a))

        guard keyCombinations.count == 3 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .d, control: true))
        XCTAssertEqual(keyCombinations[1], KeyCombination(key: .a))
        XCTAssertEqual(keyCombinations[2], KeyCombination(key: .left))
    }

    func test_that_rb_returns_control_d_b_left() {
        let keyCombinations = ksNormalMode.r(with: KeyCombination(key: .b))

        guard keyCombinations.count == 3 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .d, control: true))
        XCTAssertEqual(keyCombinations[1], KeyCombination(key: .b))
        XCTAssertEqual(keyCombinations[2], KeyCombination(key: .left))
    }

    func test_that_ri_returns_control_d_i_left() {
        let keyCombinations = ksNormalMode.r(with: KeyCombination(key: .i))

        guard keyCombinations.count == 3 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .d, control: true))
        XCTAssertEqual(keyCombinations[1], KeyCombination(key: .i))
        XCTAssertEqual(keyCombinations[2], KeyCombination(key: .left))
    }

}
