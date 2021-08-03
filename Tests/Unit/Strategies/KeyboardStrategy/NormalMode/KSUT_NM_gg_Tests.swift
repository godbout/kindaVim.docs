@testable import kindaVim
import XCTest

class KS_gg_Tests: KS_BaseTests {
    
    // gg (and G) have different moves depending on the role of the focused element :D
    // dropdowns use option up/down while (currently) all others use command up/down
    func test_that_for_AXWebArea_gg_returns_command_up() {
        let keyCombinations = ksNormalMode.gg(on: .webArea)

        guard keyCombinations.count == 1 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .up, command: true))
    }
    
    func test_that_for_other_roles_gg_returns_option_up() {
        let keyCombinations = ksNormalMode.gg(on: .someOtherShit)
        
        guard keyCombinations.count == 1 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .up, option: true))
    }
    
}

