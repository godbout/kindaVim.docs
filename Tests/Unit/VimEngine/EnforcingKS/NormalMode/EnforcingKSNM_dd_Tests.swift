@testable import kindaVim
import XCTest


class EnforcingKS_dd_Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .d), enforceKeyboardStrategy: true)
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .d), enforceKeyboardStrategy: true)
    }

}


extension EnforcingKS_dd_Tests {
    
    func test_that_dd_calls_the_dd_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "dd(on:)")
    }
    
    func test_that_dd_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
    
}

