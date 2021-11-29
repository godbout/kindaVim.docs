@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_caw_Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight), appMode: .enforceKeyboardStrategy)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c), appMode: .enforceKeyboardStrategy)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .a), appMode: .enforceKeyboardStrategy)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .w), appMode: .enforceKeyboardStrategy)
    }

}


extension EnforcingKS_caw_Tests {
    
    func test_that_it_does_not_call_any_KS_function_because_this_move_is_not_doable_with_KS() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")
    }
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertEqual(kindaVimEngine.count, 1)
    }
}
