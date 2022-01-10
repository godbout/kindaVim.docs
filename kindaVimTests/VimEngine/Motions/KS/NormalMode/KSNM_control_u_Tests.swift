@testable import kindaVim
import KeyCombination
import XCTest


class KSNM_control_u_Tests: KSNM_BaseTests {

    override func setUp() {
super.setUp()

        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .u, control: true))
    }

}


extension KSNM_control_u_Tests {
    
    func test_that_control_u_calls_the_controlU_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "controlU()")
    }
    
    func test_that_control_u_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
        
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }

}
