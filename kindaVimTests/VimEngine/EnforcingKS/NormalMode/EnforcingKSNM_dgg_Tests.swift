@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_dgg_Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        kindaVimEngine.handle(keyCombination: KeyCombination(key: .d), enforceKeyboardStrategy: true)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .g), enforceKeyboardStrategy: true)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .g), enforceKeyboardStrategy: true)
    }

}


extension EnforcingKS_dgg_Tests {

    func test_that_dgg_calls_the_dgg_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "dgg()")
    }

    func test_that_dgg_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }

}
