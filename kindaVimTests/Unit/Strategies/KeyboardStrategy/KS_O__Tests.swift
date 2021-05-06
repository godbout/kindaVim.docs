@testable import kindaVim
import XCTest

class KS_O__Tests: KS_BaseTests {
    
    func test_that_O_gets_transformed_to_command_left_enter_up() {
        let transformedKeys = keyboardStrategy.O()
        
        guard transformedKeys.count == 3 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0], KeyCombination(key: .a, control: true))
        XCTAssertEqual(transformedKeys[1], KeyCombination(key: .enter))
        XCTAssertEqual(transformedKeys[2], KeyCombination(key: .up))
    }
    
}
