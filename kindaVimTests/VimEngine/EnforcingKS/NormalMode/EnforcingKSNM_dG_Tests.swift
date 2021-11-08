@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_dG_Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        kindaVimEngine.handle(keyCombination: KeyCombination(key: .d), enforceKeyboardStrategy: true)
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .G), enforceKeyboardStrategy: true)
    }

}


extension EnforcingKS_dG_Tests {

    func test_that_dG_calls_the_dG_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "dG()")
    }

    func test_that_dG_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }

}
