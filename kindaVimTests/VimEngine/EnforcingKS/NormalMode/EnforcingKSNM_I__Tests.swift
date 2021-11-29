@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_I_Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight), appMode: .keyMapping)
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .I), appMode: .keyMapping)
    }

}


extension EnforcingKS_I_Tests {
    
    func test_that_I_calls_the_I_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "I()")
    }
    
    func test_that_I_switches_Vim_to_insert_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .insert)
    }
        
    func test_that_it_resets_the_count() {
        XCTAssertEqual(kindaVimEngine.count, 1)
    }

}
