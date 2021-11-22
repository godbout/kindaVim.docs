@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_s_Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight), enforceKeyboardStrategy: true)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .s), enforceKeyboardStrategy: true)
    }

}


extension EnforcingKS_s_Tests {

    func test_that_s_calls_the_s_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "s()")
    }

    func test_that_s_switches_Vim_to_insert_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .insert)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertEqual(kindaVimEngine.count, 1)
    }

}
