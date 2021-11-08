@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_daw_Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        kindaVimEngine.handle(keyCombination: KeyCombination(key: .d), enforceKeyboardStrategy: true)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .a), enforceKeyboardStrategy: true)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .w), enforceKeyboardStrategy: true)
    }

}


extension EnforcingKS_daw_Tests {
    
    func test_that_it_does_not_call_any_KS_function_because_this_move_is_not_doable_with_KS() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")
    }
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
}
