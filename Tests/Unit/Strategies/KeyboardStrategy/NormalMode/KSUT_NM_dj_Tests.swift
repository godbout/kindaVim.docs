@testable import kindaVim
import XCTest

// see dd for blah blah
class KS_dj_Tests: KSUT_BaseTests {

    func test_that_forAXWebArea_dj_returns_a_big_pile_of_key_combinations() {
        let keyCombinations = ksNormalMode.dj(on: .webArea)

        guard keyCombinations.count == 7 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .left, command: true))
        XCTAssertEqual(keyCombinations[1], KeyCombination(key: .left, command: true))
        XCTAssertEqual(keyCombinations[2], KeyCombination(key: .down, shift: true))
        XCTAssertEqual(keyCombinations[3], KeyCombination(key: .down, shift: true))
        XCTAssertEqual(keyCombinations[4], KeyCombination(key: .delete))
        XCTAssertEqual(keyCombinations[5], KeyCombination(key: .right, command: true))
        XCTAssertEqual(keyCombinations[6], KeyCombination(key: .left, command: true))
    }
    
    func test_that_for_other_roles_dj_returns_shift_down_delete() {
        let keyCombinations = ksNormalMode.dj(on: .someOtherShit)
        
        guard keyCombinations.count == 2 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .down, shift: true))
        XCTAssertEqual(keyCombinations[1], KeyCombination(key: .delete))
    }

}
