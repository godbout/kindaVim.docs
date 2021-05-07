@testable import kindaVim
import XCTest

class KS_O__Tests: KS_BaseTests {
    
    func test_that_O_returns_control_a_enter_up() {
        let keyCombinations = keyboardStrategy.O()
        
        guard keyCombinations.count == 3 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .a, control: true))
        XCTAssertEqual(keyCombinations[1], KeyCombination(key: .enter))
        XCTAssertEqual(keyCombinations[2], KeyCombination(key: .up))
    }
    
}
