@testable import kindaVim
import XCTest

class KS_O__Tests: KS_BaseTests {
    
    func test_that_O_returns_control_a_enter_up() {
        let keyCombinations = keyboardStrategy.O()
        
        guard keyCombinations.count == 4 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .right, command: true))
        XCTAssertEqual(keyCombinations[1], KeyCombination(key: .left, command: true))
        XCTAssertEqual(keyCombinations[2], KeyCombination(key: .enter))
        XCTAssertEqual(keyCombinations[3], KeyCombination(key: .up))
    }
    
}
