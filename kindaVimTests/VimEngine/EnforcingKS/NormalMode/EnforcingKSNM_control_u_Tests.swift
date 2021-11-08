@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_control_u_Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        kindaVimEngine.handle(keyCombination: KeyCombination(key: .u, control: true), enforceKeyboardStrategy: true)
    }

}


extension EnforcingKS_control_u_Tests {
    
    func test_that_control_u_calls_the_controlU_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "controlU()")
    }
    
    func test_that_control_u_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }

}
