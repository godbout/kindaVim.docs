@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_cc_Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .c), enforceKeyboardStrategy: true)
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .c), enforceKeyboardStrategy: true)
    }

}


extension EnforcingKS_cc_Tests {
    
    func test_that_cc_calls_the_cc_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "cc()")
    }
    
    func test_that_cc_switches_Vim_to_insert_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .insert)
    }

}
