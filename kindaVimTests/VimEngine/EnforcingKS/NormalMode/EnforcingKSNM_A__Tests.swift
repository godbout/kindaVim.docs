@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_A__Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight), appMode: .keyMapping)
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .A), appMode: .keyMapping)
    }

}


extension EnforcingKS_A__Tests {
    
    func test_that_A_calls_the_A_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "A()")
    }
    
    func test_that_A_switches_Vim_to_insert_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .insert)
    }
        
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }

}
