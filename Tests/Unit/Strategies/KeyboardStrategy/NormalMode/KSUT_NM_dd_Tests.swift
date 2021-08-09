@testable import kindaVim
import XCTest


// dd will have different moves depending of the type of Element we're dealing with
// so that we can delete a list item, or act like a real dd for WebAreas and such
class KSUT_NM_dd_Tests: KSUT_BaseTests {
    
    func test_that_for_AXWebArea_dd_returns_a_big_pile_of_key_combinations() {
        let keyCombinations = ksNormalMode.dd(on: .webArea)

        guard keyCombinations.count == 12 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .right, command: true))
        XCTAssertEqual(keyCombinations[1], KeyCombination(key: .left, shift: true, command: true))
        XCTAssertEqual(keyCombinations[2], KeyCombination(key: .left, shift: true, command: true))
        XCTAssertEqual(keyCombinations[3], KeyCombination(key: .delete))
        XCTAssertEqual(keyCombinations[4], KeyCombination(key: .down))
        XCTAssertEqual(keyCombinations[5], KeyCombination(key: .left, command: true))
        XCTAssertEqual(keyCombinations[6], KeyCombination(key: .left, command: true))
        XCTAssertEqual(keyCombinations[7], KeyCombination(key: .delete))
        XCTAssertEqual(keyCombinations[8], KeyCombination(key: .left, command: true))
        XCTAssertEqual(keyCombinations[9], KeyCombination(key: .left, command: true))
        XCTAssertEqual(keyCombinations[10], KeyCombination(key: .right, command: true))
        XCTAssertEqual(keyCombinations[11], KeyCombination(key: .left, command: true))
    }
    
    func test_that_for_other_roles_dd_returns_delete() {
        let keyCombinations = ksNormalMode.dd(on: .someOtherShit)
        
        guard keyCombinations.count == 1 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .delete))
    }
    
}
