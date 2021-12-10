@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_ce_Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight), appMode: .keyMapping)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c), appMode: .keyMapping)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .e), appMode: .keyMapping)
    }

}


extension EnforcingKS_ce_Tests {
    
    func test_that_the_move_calls_the_correct_function_for_TextElements_on_KS() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "ce()")
    }
    
    func test_that_it_switches_Vim_to_insert_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .insert)
    }

    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }
    
}
