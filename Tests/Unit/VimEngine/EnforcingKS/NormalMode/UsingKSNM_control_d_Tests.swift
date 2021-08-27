@testable import kindaVim
import XCTest

class UsingKS_control_d_Tests: UsingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(
            keyCombination: KeyCombination(key: .d, control: true),
            enforceKeyboardStrategy: true
        )
    }

}

extension UsingKS_control_d_Tests {
    
    func test_that_control_d_calls_the_controlD_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "controlD()")
    }
    
    func test_that_control_d_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }

}

