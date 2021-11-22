@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_control_d_Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight), enforceKeyboardStrategy: true)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .d, control: true), enforceKeyboardStrategy: true)
    }

}


extension EnforcingKS_control_d_Tests {
    
    func test_that_control_d_calls_the_controlD_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "controlD()")
    }
    
    func test_that_control_d_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
      
    func test_that_it_resets_the_count() {
        XCTAssertEqual(kindaVimEngine.count, 1)
    }

}

