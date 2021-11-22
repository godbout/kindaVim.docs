@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_b_Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight), enforceKeyboardStrategy: true)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .b), enforceKeyboardStrategy: true)
    }

}


extension EnforcingKS_b_Tests {
    
    func test_that_b_calls_the_b_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "b()")
    }
    
    func test_that_b_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertEqual(kindaVimEngine.count, 1)
    }

}
