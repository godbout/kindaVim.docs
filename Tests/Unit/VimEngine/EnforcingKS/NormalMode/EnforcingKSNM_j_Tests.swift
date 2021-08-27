@testable import kindaVim
import XCTest


class EnforcingKS_j_Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(
            keyCombination: KeyCombination(key: .j),
            enforceKeyboardStrategy: true
        )
    }

}


extension EnforcingKS_j_Tests {
    
    func test_that_j_calls_the_j_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "j()")
    }
    
    func test_that_j_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
    
}

