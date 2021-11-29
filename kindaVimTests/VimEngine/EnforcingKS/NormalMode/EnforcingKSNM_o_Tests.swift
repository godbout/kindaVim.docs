@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_o_Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight), appMode: .keyMapping)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .o), appMode: .keyMapping)
    }

}


extension EnforcingKS_o_Tests {
    
    func test_that_o_calls_the_o_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "o()")
    }
    
    func test_that_o_switches_Vim_to_insert_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .insert)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertEqual(kindaVimEngine.count, 1)
    }

}



