@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_$_Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(
            keyCombination: KeyCombination(vimKey: .dollarSign),
            enforceKeyboardStrategy: true
        )
    }

}


extension EnforcingKS_$_Tests {
    
    func test_that_$_calls_the_dollarSign_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "dollarSign()")
    }

    func test_that_$_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
    
}
