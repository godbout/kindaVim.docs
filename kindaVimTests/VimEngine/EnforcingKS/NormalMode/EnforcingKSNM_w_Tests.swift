@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_w_Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .w), enforceKeyboardStrategy: true)
    }

}


extension EnforcingKS_w_Tests {
    
    func test_that_w_calls_the_w_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "w()")
    }
    
    func test_that_w_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
    
}
