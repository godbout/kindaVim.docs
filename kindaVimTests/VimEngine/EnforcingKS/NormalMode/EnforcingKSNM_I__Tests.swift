@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_I_Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(
            keyCombination: KeyCombination(vimKey: .I),
            enforceKeyboardStrategy: true
        )
    }

}


extension EnforcingKS_I_Tests {
    
    func test_that_I_calls_the_I_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "I()")
    }
    
    func test_that_I_switches_Vim_to_insert_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .insert)
    }

}
