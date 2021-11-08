@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_control_r_Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        kindaVimEngine.handle(keyCombination: KeyCombination(key: .r, control: true), enforceKeyboardStrategy: true)
    }

}


extension EnforcingKS_control_r_Tests {
    
    func test_that_control_r_calls_the_controlR_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "controlR()")
    }
    
    func test_that_control_r_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }

}
