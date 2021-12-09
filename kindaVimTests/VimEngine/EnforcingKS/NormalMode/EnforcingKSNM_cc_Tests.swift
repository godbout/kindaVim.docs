@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_cc_Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight), appMode: .keyMapping)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c), appMode: .keyMapping)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c), appMode: .keyMapping)
    }

}


extension EnforcingKS_cc_Tests {
    
    func test_that_cc_calls_the_cc_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "cc()")
    }
    
    func test_that_cc_switches_Vim_to_insert_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .insert)
    }

    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }
    
}
