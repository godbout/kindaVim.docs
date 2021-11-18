@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_cG_Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c), enforceKeyboardStrategy: true)
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .G), enforceKeyboardStrategy: true)
    }

}


extension EnforcingKS_cG_Tests {
    
    func test_that_cG_calls_the_cG_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "cG()")
    }
    
    func test_that_cG_switches_Vim_to_insert_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .insert)
    }

}
