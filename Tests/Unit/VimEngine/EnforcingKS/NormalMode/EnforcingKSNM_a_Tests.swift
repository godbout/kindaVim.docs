@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_a_Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(
            keyCombination: KeyCombination(key: .a),
            enforceKeyboardStrategy: true
        )
    }

}


extension EnforcingKS_a_Tests {
    
    func test_that_a_calls_the_a_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "a()")
    }
    
    func test_that_a_switches_Vim_to_insert_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .insert)
    }

}
