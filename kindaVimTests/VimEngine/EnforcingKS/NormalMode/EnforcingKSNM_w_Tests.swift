@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_w_Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight), appMode: .enforceKeyboardStrategy)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .w), appMode: .enforceKeyboardStrategy)
    }

}


extension EnforcingKS_w_Tests {
    
    func test_that_w_calls_the_w_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "w()")
    }
    
    func test_that_w_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertEqual(kindaVimEngine.count, 1)
    }

}
