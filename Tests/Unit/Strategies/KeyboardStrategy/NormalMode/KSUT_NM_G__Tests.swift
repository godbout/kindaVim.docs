@testable import kindaVim
import XCTest


// see gg for blah blah 
class KSUT_NM_G__Tests: KSUT_NM_BaseTests {

    func test_that_for_AXWebArea_G_returns_command_down() {
        let keyCombinations = ksNormalMode.G(on: .webArea)

        guard keyCombinations.count == 1 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .down, command: true))
    }
    
    func test_that_for_other_roles_G_returns_option_down() {
        let keyCombinations = ksNormalMode.G(on: .someOtherShit)
        
        guard keyCombinations.count == 1 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .down, option: true))
    }
    
}
