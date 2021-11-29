@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_X__Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight), appMode: .enforceKeyboardStrategy)
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .X), appMode: .enforceKeyboardStrategy)
    }

}


extension EnforcingKS_X__Tests {
    
    func test_that_X_calls_the_X_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "X()")
    }

    func test_that_X_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertEqual(kindaVimEngine.count, 1)
    }

}
