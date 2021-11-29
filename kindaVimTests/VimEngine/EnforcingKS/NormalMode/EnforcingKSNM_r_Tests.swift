@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_r_Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight), appMode: .enforceKeyboardStrategy)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .r), appMode: .enforceKeyboardStrategy)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .g), appMode: .enforceKeyboardStrategy)
    }

}


extension EnforcingKS_r_Tests {

    func test_that_r_calls_the_r_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "r(with:)")
    }

    func test_that_k_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertEqual(kindaVimEngine.count, 1)
    }

}


