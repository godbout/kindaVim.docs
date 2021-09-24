@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_r_Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .r), enforceKeyboardStrategy: true)
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .g), enforceKeyboardStrategy: true)
    }

}


extension EnforcingKS_r_Tests {

    func test_that_r_calls_the_r_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "r(with:)")
    }

    func test_that_k_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }

}


