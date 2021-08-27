@testable import kindaVim
import XCTest


class EnforcingKS_u_Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(
            keyCombination: KeyCombination(key: .u),
            enforceKeyboardStrategy: true
        )
    }

}


extension EnforcingKS_u_Tests {
    
    func test_that_u_calls_the_u_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "u()")
    }
    
    func test_that_u_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
    
}
