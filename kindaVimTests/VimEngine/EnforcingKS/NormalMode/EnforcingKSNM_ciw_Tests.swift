@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_ciw_Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight), appMode: .keyMapping)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c), appMode: .keyMapping)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .i), appMode: .keyMapping)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .w), appMode: .keyMapping)
    }

}


extension EnforcingKS_ciw_Tests {
    
    func test_that_ciw_calls_the_ciw_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "ciw()")
    }
    
    func test_that_ciw_switches_Vim_to_insert_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .insert)
    }
        
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }
    
}
