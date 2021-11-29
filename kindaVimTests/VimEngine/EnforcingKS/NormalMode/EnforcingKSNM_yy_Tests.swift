@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_yy_Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight), appMode: .enforceKeyboardStrategy)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .y), appMode: .enforceKeyboardStrategy)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .y), appMode: .enforceKeyboardStrategy)
    }

}


extension EnforcingKS_yy_Tests {

    func test_that_yy_calls_the_yy_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "yy()")
    }

    func test_that_yy_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertEqual(kindaVimEngine.count, 1)
    }

}

