@testable import kindaVim
import XCTest

class KS_O__Tests: KS_BaseTests {
    
    func test_that_O_gets_transformed_to_command_left_enter_up() {
        let transformedKeys = keyboardStrategy.O()
        
        guard transformedKeys.count == 3 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .a)
        XCTAssertEqual(transformedKeys[0].control, true)
        XCTAssertEqual(transformedKeys[0].action, .both)
        XCTAssertEqual(transformedKeys[1].key, .enter)
        XCTAssertEqual(transformedKeys[1].action, .both)
        XCTAssertEqual(transformedKeys[2].key, .up)
        XCTAssertEqual(transformedKeys[2].action, .both)
    }
    
}
