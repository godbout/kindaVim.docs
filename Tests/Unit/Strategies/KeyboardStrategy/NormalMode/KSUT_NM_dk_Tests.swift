@testable import kindaVim
import XCTest

// see dd for blah blah
class KS_dk_Tests: KSUT_BaseTests {
    
    func test_that_for_AXWebArea_dk_returns_a_big_pile_of_key_combinations() {
        let keyCombinations = ksNormalMode.dk(on: .webArea)
        
        guard keyCombinations.count == 7 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .right, command: true))
        XCTAssertEqual(keyCombinations[1], KeyCombination(key: .left, shift: true, command: true))
        XCTAssertEqual(keyCombinations[2], KeyCombination(key: .left, shift: true, command: true))
        XCTAssertEqual(keyCombinations[3], KeyCombination(key: .up, shift: true))
        XCTAssertEqual(keyCombinations[4], KeyCombination(key: .delete))
        XCTAssertEqual(keyCombinations[5], KeyCombination(key: .down))
        XCTAssertEqual(keyCombinations[6], KeyCombination(key: .delete))
    }
    
    func test_that_for_AXScrollArea_dk_returns_a_big_pile_of_key_combinations() {
        let keyCombinations = ksNormalMode.dk(on: .scrollArea)
        
        guard keyCombinations.count == 7 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .right, command: true))
        XCTAssertEqual(keyCombinations[1], KeyCombination(key: .left, shift: true, command: true))
        XCTAssertEqual(keyCombinations[2], KeyCombination(key: .left, shift: true, command: true))
        XCTAssertEqual(keyCombinations[3], KeyCombination(key: .up, shift: true))
        XCTAssertEqual(keyCombinations[4], KeyCombination(key: .delete))
        XCTAssertEqual(keyCombinations[5], KeyCombination(key: .down))
        XCTAssertEqual(keyCombinations[6], KeyCombination(key: .delete))
    }
    
    func test_that_for_other_roles_dk_returns_shift_up_delete() {
        let keyCombinations = ksNormalMode.dk(on: .someOtherShit)
        
        guard keyCombinations.count == 2 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .up, shift: true))
        XCTAssertEqual(keyCombinations[1], KeyCombination(key: .delete))
    }
    
}
