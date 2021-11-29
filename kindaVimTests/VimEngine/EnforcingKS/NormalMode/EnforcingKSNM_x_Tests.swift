@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_x_Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight), appMode: .enforceKeyboardStrategy)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .x), appMode: .enforceKeyboardStrategy)
    }

}


extension EnforcingKS_x_Tests {
    
    func test_that_x_calls_the_x_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "x()")
    }
    
    func test_that_x_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertEqual(kindaVimEngine.count, 1)
    }

}
