@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_cb_Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .c), enforceKeyboardStrategy: true)
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .b), enforceKeyboardStrategy: true)
    }

}


extension EnforcingKS_cb_Tests {

    func test_that_cb_calls_the_cb_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "cb()")
    }

    func test_that_cb_switches_Vim_to_insert_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .insert)
    }

}
