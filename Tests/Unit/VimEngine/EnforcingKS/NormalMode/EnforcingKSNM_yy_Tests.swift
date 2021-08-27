@testable import kindaVim
import XCTest


class EnforcingKS_yy_Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .y), enforceKeyboardStrategy: true)
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .y), enforceKeyboardStrategy: true)
    }

}


extension EnforcingKS_yy_Tests {

    func test_that_yy_calls_the_yy_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "yy()")
    }

    func test_that_yy_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }

}

